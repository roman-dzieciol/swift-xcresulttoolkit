
import Foundation

public enum FormatPrinterError: Error {
    case unsupportedProperty(V3_19.TypeDescription.PropertyInfo)
}

extension V3_19.FormatDescription.VersionInfo {
    public var namespace: String {
        return "V\(major)_\(minor)"
    }
}

public extension Property {

    convenience init(propertyInfo info: V3_19.TypeDescription.PropertyInfo) throws {
        switch info.type {
        case "Optional":
            guard let wrappedType = info.wrappedType else {
                throw FormatPrinterError.unsupportedProperty(info)
            }
            self.init(name: info.name, type: wrappedType, isArray: false, isOptional: true, wrappedType: nil)

        case "Array":
            guard let wrappedType = info.wrappedType else {
                throw FormatPrinterError.unsupportedProperty(info)
            }
            self.init(name: info.name, type: wrappedType, isArray: true, isOptional: false, wrappedType: nil)

        default:
            self.init(name: info.name, type: info.type, isArray: false, isOptional: false, wrappedType: info.wrappedType)
        }
    }
}

public extension V3_19 {
    class FormatModelImporter {

        var typesByName: [String: V3_19.TypeDescription] = [:]
        var topLevelTypesByName: [String: TopLevelType] = [:]

        public init() {
        }

        public func formatModel(from formatDescription: V3_19.FormatDescription) throws -> FormatModel {
            try load(formatDescription: formatDescription)
            return FormatModel(version: formatDescription.version.namespace,
                               topLevelTypesByName: topLevelTypesByName)
        }

        func load(formatDescription: V3_19.FormatDescription) throws {
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
            else if let type = typesByName[typeName], type.kind == .object {
                let supertype = try type.type.supertype.flatMap {
                    try load(typeName: $0)
                }
                let properties = try type.properties?.map {
                    try Property(propertyInfo: $0)
                    } ?? []
                let result = TopLevelType(name: typeName, supertype: supertype, properties: properties)
                topLevelTypesByName[typeName] = result
                return result
            } else {
                return nil
            }
        }
    }


}

