
import Foundation

public enum V3_20_Static {
}

extension V3_20_Static {
    
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
        }

        public let type: TypeInfo
        public let kind: KindInfo
        public let properties: [PropertyInfo]?
    }
}
