//
//  {{ service["name"] }}.swift
//  BattleNetKit
//
//  DO NOT EDIT. File generated automatically.
//

import Foundation
import NIO
import SwiftProtobuf

class {{ service["name"] }}: ServiceType {
    enum Method: Int, MethodType {
        {% for method in service["methods"] %}
        case {{ method["name"] }} = {{ method["id"] }}{% endfor %}
        
        var name: String {
            switch self {
            {% for method in service["methods"] %}case .{{ method["name"] }}: return "{{ method["name"] }}"
            {% endfor %}
            }
        }
        
        var responseType: Message.Type {
            switch self {
            {% for method in service["methods"] %}case .{{ method["name"] }}: return {{ method["response"] }}.self
            {% endfor %}
            }
        }
        
        var requestType: Message.Type {
            switch self {
            {% for method in service["methods"] %}case .{{ method["name"] }}: return {{ method["request"] }}.self
            {% endfor %}
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "{{ service["id"] }}"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    {% if service["is_inbound"] %} weak var delegate: {{ service["name"] }}Handler? {% endif %}

    init(eventLoop: EventLoop, messageQueue: AuroraMessageQueue) {
        self.eventLoop = eventLoop
        self.messageQueue = messageQueue
    }

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
}

{% if service["is_outbound"] %}
extension {{ service["name"] }} {
    {% for method in service["methods"] %}
    func {{ method["name"] }}(request: {{ method["request"] }}) -> EventLoopFuture<{{ method["response"] }}> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.{{ method["name"] }}))
    }
    {% endfor %}
}
{% endif %}

{% if service["is_inbound"] %}
extension {{ service["name"] }} {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            {% for method in service["methods"] %}
            case .{{ method["name"] }}:
                {% if method["request"] == "Bgs_Protocol_NoData" %}
                return delegate.{{ method["name"] }}().map { $0 as Message }
                {% else %}
                guard let message = request as? {{ method["request"] }} else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: {{ method["request"] }}.self, 
                        received: type(of: request)
                    )
                }
                return delegate.{{ method["name"] }}(request: message).map { $0 as Message }
                {% endif %}
            {% endfor %}
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol {{ service["name"] }}Handler: class {
    var eventLoop: EventLoop { get }

    {% for method in service["methods"] %}

    {% if method["request"] == "Bgs_Protocol_NoData" %}
    func {{ method["name"] }}() 
            -> EventLoopFuture<{{ method["response"] }}>
    {% else %}
    func {{ method["name"] }}(request: {{ method["request"] }}) 
            -> EventLoopFuture<{{ method["response"] }}>
    {% endif %}
    {% endfor %}
}

extension {{ service["name"] }}Handler {
    {% for method in service["methods"] %}

    {% if method["request"] == "Bgs_Protocol_NoData" %}
    func {{ method["name"] }}() 
            -> EventLoopFuture<{{ method["response"] }}>
    {% else %}
    func {{ method["name"] }}(request: {{ method["request"] }}) 
            -> EventLoopFuture<{{ method["response"] }}>
    {% endif %} {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: {{ service["name"] }}.Method.{{ method["name"] }}, 
                of: {{ service["name"] }}.self
            )
        )
    }
    {% endfor %}
}

{% endif %}