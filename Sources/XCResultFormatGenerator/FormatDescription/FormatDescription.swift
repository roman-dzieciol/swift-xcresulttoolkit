
import Foundation


public struct FormatDescription: Codable {
    
    public struct VersionInfo: Codable {
        public let major: Int
        public let minor: Int
    }
    
    public let signature: String
    public let name: String
    public let version: VersionInfo
    public let types: [TypeDescription]
}

public struct TypeDescription: Codable {
    
    public struct TypeInfo: Codable {
        public let name: String
        public let supertype: String?
    }
    
    public enum KindInfo: String, Codable {
        case value
        case object
        case array
    }
    
    public struct PropertyInfo: Codable {
        public let name: String
        public let type: String
        public let isOptional: Bool
        public let wrappedType: String?
        
        public var actualType: String {
            return wrappedType ?? type
        }
    }
    
    public let type: TypeInfo
    public let kind: KindInfo
    public let properties: [PropertyInfo]?
}

extension TypeDescription.PropertyInfo {
    
    func withSchemaFixes() -> TypeDescription.PropertyInfo {
        return TypeDescription.PropertyInfo(name: name, type: type, isOptional: true, wrappedType: wrappedType)
    }
}

extension TypeDescription {
    
    func withSchemaFixes() -> TypeDescription {
        return TypeDescription(type: type, kind: kind, properties: properties?.map {
            return $0.withSchemaFixes()
        })
    }
}

extension FormatDescription {
    
    func withSchemaFixes() -> FormatDescription {
        return FormatDescription(signature: signature, name: name, version: version, types: types.map {
            return $0.withSchemaFixes()
        })
    }
}
