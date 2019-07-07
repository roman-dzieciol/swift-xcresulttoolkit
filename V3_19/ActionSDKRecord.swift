
import Foundation

public extension V3_19 {

    class ActionSDKRecord: Codable {
        public let name: String
        public let identifier: String
        public let operatingSystemVersion: String
        public let isInternal: Bool

        private enum CodingKeys: CodingKey {
            case name
            case identifier
            case operatingSystemVersion
            case isInternal
        }

        public init(
            name: String,
            identifier: String,
            operatingSystemVersion: String,
            isInternal: Bool
            ) {
            self.name = name
            self.identifier = identifier
            self.operatingSystemVersion = operatingSystemVersion
            self.isInternal = isInternal
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            identifier = try container.decode(String.self, forKey: .identifier)
            operatingSystemVersion = try container.decode(String.self, forKey: .operatingSystemVersion)
            isInternal = try container.decode(Bool.self, forKey: .isInternal)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(identifier, forKey: .identifier)
            try container.encode(operatingSystemVersion, forKey: .operatingSystemVersion)
            try container.encode(isInternal, forKey: .isInternal)
        }
    }
}
