
import Foundation

public extension V3_20 {

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
            name = try container.decode(_Value<String>.self, forKey: .name)._value
            identifier = try container.decode(_Value<String>.self, forKey: .identifier)._value
            operatingSystemVersion = try container.decode(_Value<String>.self, forKey: .operatingSystemVersion)._value
            isInternal = try container.decode(_Value<Bool>.self, forKey: .isInternal)._value
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
