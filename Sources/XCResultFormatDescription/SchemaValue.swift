
import Foundation

public struct TypeMetaData {
    private enum CodingKeys: String, CodingKey {
        case name = "_name"
        case supertype = "_supertype"
        case type = "_type"
        case value = "_value"
        case values = "_values"
    }
}

public protocol SchemaValue {
    static var valueKey: String { get }
}

public struct _Value<T: Codable & _ValueFromStringInitable>: Codable, SchemaValue {
    public let _value: T
    public static var valueKey: String { return CodingKeys._value.stringValue }
    
    private enum CodingKeys: CodingKey {
        case _value
    }
    
    public init(
        _value: T
    ) {
        self._value = _value
    }
    
    public init(
        from decoder: Decoder
    ) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _value = T(fromValueString: try container.decode(String.self, forKey: ._value))
    }
    
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}

public struct _Values<T: Codable>: Codable, SchemaValue {
    public let _values: [T]
    public static var valueKey: String { return CodingKeys._values.stringValue }
}

public struct _SuperType: Codable {
    public let _name: String
}

public struct _Type: Codable {
    public let _name: String
    public let _supertype: _SuperType?
}
