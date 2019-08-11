
import Foundation

public extension V3_20 {

    class ActionPlatformRecord: Codable {
        public let identifier: String?
        public let userDescription: String?

        private enum CodingKeys: CodingKey {
            case identifier
            case userDescription
        }

        public init(
            identifier: String?,
            userDescription: String?
            ) {
            self.identifier = identifier
            self.userDescription = userDescription
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            identifier = try container.decodeIfPresent(_Value<String>.self, forKey: .identifier)?._value
            userDescription = try container.decodeIfPresent(_Value<String>.self, forKey: .userDescription)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(identifier, forKey: .identifier)
            try container.encodeIfPresent(userDescription, forKey: .userDescription)
        }
    }
}
