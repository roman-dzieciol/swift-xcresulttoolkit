
import Foundation

public enum FormatPrinterError: Error {
    case unsupportedProperty(TypeDescription.PropertyInfo)
}

extension FormatDescription.VersionInfo {
    public var namespace: String {
        return "V\(major)_\(minor)"
    }
}

public extension Property {

    convenience init(propertyInfo info: TypeDescription.PropertyInfo, isValue: Bool) throws {
        switch info.type {
        case "Optional":
            guard let wrappedType = info.wrappedType else {
                throw FormatPrinterError.unsupportedProperty(info)
            }
            self.init(name: info.name, type: wrappedType, isArray: false, isOptional: true, isValue: isValue, wrappedType: nil)

        case "Array":
            guard let wrappedType = info.wrappedType else {
                throw FormatPrinterError.unsupportedProperty(info)
            }
            self.init(name: info.name, type: wrappedType, isArray: true, isOptional: info.isOptional, isValue: isValue, wrappedType: nil)

        default:
            self.init(name: info.name, type: info.type, isArray: false, isOptional: info.isOptional, isValue: isValue, wrappedType: info.wrappedType)
        }
    }
}

class FormatModelImporter {
    
    var typesByName: [String: TypeDescription] = [:]
    var topLevelTypesByName: [String: TopLevelType] = [:]
    
    public init() {
    }
    
    public func formatModel(from formatDescription: FormatDescription) throws -> FormatModel {
        try load(formatDescription: formatDescription)
        return FormatModel(version: formatDescription.version.namespace,
                           topLevelTypesByName: topLevelTypesByName)
    }
    
    func load(formatDescription: FormatDescription) throws {
        formatDescription.types.forEach { type in
            typesByName[type.type.name] = type
        }
        
        try formatDescription.types.forEach { type in
            try load(typeName: type.type.name)
        }
    }
    
    @discardableResult
    func load(typeName: String) throws -> TopLevelType? {
        if let result = topLevelTypesByName[typeName] {
            return result
        }
        else if let type = typesByName[typeName] {
            let supertype = try type.type.supertype.flatMap {
                try load(typeName: $0)
            }
            let properties: [Property] = try type.properties?.map {
                let isValue = typesByName[$0.actualType]?.kind == .some(.value)
                return try Property(propertyInfo: $0, isValue: isValue)
                } ?? []
            let isValue = type.kind == .value
            let isArray = type.kind == .array
            let result = TopLevelType(name: typeName, supertype: supertype, isValue: isValue, isArray: isArray, properties: properties)
            topLevelTypesByName[typeName] = result
            return result
        } else {
            return nil
        }
    }
}

