
import Foundation

public class Property {
    public let name: String
    public let type: String
    public let isArray: Bool
    public let isOptional: Bool
    public let wrappedType: String?

    public init(
        name: String,
        type: String,
        isArray: Bool,
        isOptional: Bool,
        wrappedType: String?
        ) {
        self.name = name
        self.type = type
        self.isArray = isArray
        self.isOptional = isOptional
        self.wrappedType = wrappedType
    }

    var nonOptional: Property {
        return Property(name: name, type: type, isArray: isArray, isOptional: false, wrappedType: wrappedType)
    }
}
