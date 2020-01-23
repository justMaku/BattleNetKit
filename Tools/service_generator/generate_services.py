#!/usr/bin/env python3

from google.protobuf.descriptor_pb2 import ServiceDescriptorProto
from google.protobuf.descriptor_pb2 import DescriptorProto
from google.protobuf.compiler import plugin_pb2 as plugin

import method_options_pb2
import service_options_pb2

import os
import sys
import itertools
import json
from jinja2 import Template


def log(line):
    f = open("generate_services.log", "a+")
    f.write(line + "\n")
    f.close()


def traverse(proto_file):

    def _traverse(package, items):
        for item in items:
            yield item, package

            if isinstance(item, DescriptorProto):
                for enum in item.enum_type:
                    yield enum, package

                for nested in item.nested_type:
                    nested_package = package + item.name

                    for nested_item in _traverse(nested, nested_package):
                        yield nested_item, nested_package

    return itertools.chain(
        _traverse(proto_file.package, proto_file.service),
        _traverse(proto_file.package, proto_file.message_type),
        _traverse(proto_file.package, proto_file.enum_type),
    )


def translate(name):
    def join_parts(part):
        subparts = part.split('_')
        subparts = map(
            lambda subpart: subpart[:1].upper() + subpart[1:], subparts)
        return "".join(subparts)

    parts = name.split('.')
    parts = filter(lambda part: len(part) > 0, parts)
    parts = map(lambda part: join_parts(part), parts)
    parts = map(lambda part: part[:1].upper() + part[1:], parts)

    return "_".join(parts).replace("NORESPONSE", "NO_RESPONSE")


def handle(service):
    options = service.options.Extensions[service_options_pb2.service_options]
    sdk_options = service.options.Extensions[service_options_pb2.sdk_service_options]

    data = {
        'name': translate(options.descriptor_name),
        'id': options.descriptor_name,
    }

    direction = None
    if sdk_options.inbound:
        data.update({"is_inbound": True})
    if sdk_options.outbound:
        data.update({"is_outbound": True})
    methods = []
    for method in service.method:
        method_id = method.options.Extensions[method_options_pb2.method_options].id

        methods.append(
            {
                "name": method.name,
                "request": translate(method.input_type),
                "response": translate(method.output_type),
                "id": method_id
            }
        )

    data.update({
        "methods": methods
    })

    return data


def render(service):
    template = Template(
        open(os.path.dirname(os.path.abspath(__file__)) +
             '/templates/service.swift').read()
    )

    return template.render(service=service)


def generate_code(request, response):
    for proto_file in request.proto_file:
        services = []

        # Parse request
        for item, package in traverse(proto_file):
            if type(item) is not ServiceDescriptorProto:
                continue

            service = handle(item)

            services.append(service)

        # Fill response
        for service in services:
            f = response.file.add()
            f.name = translate(service["id"]) + '.swift'
            f.content = render(service)


if __name__ == '__main__':
    stdin = open(sys.stdin.fileno(), mode='rb', closefd=False)
    stdout = open(sys.stdout.fileno(), mode='wb', closefd=False)

    data = stdin.read()
    # Parse request
    request = plugin.CodeGeneratorRequest()
    request.ParseFromString(data)

    # Create response
    response = plugin.CodeGeneratorResponse()

    # Generate code
    generate_code(request, response)

    # Serialise response message
    output = response.SerializeToString()

    # Write to stdout
    stdout.write(output)
