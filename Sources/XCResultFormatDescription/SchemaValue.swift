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

// in 3.20 schema is invalid - xcresulttool always returns strings for non-string value types
public protocol _ValueFromStringInitable {
    init(fromValueString string: String)
}

extension Int: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Float: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Double: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension String: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)
    }
}

extension Bool: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        self.init(string)!
    }
}

extension Date: _ValueFromStringInitable {
    public init(fromValueString string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self.init(timeIntervalSince1970: formatter.date(from: string)!.timeIntervalSince1970)
    }
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
