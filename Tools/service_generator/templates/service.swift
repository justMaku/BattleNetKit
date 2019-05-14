//
//  {{ service['name'] }}.swift
//  BattleNetKit
//
//  DO NOT EDIT. File generated automatically.
//

import Foundation

class {{ service['name'] }}: ServiceType {
    var id: UInt32? = nil
    static let name = "{{ service['id'] }}"

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    static func handles(_ method: MethodType) -> Bool {
        return type(of: method) == Method.self
    }
    
    enum Method: Int, MethodType {
        {% for method in service['methods'] %}
        case {{ method["name"] }} = {{ method["id"] }}{% endfor %}
        
        var name: String {
            switch self {
            {% for method in service['methods'] %}case .{{ method["name"] }}: return "{{ method['name'] }}"
            {% endfor %}
            }
        }
        
        var responseType: Message.Type {
            switch self {
            {% for method in service['methods'] %}case .{{ method["name"] }}: return {{ method['response'] }}.self
            {% endfor %}
            }
        }
        
        var requestType: Message.Type {
            switch self {
            {% for method in service['methods'] %}case .{{ method["name"] }}: return {{ method['request'] }}.self
            {% endfor %}
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}