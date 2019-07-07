
import Foundation

public extension V3_19 {

    class ActionPlatformRecord: Codable {
        public let identifier: String
        public let userDescription: String

        private enum CodingKeys: CodingKey {
            case identifier
            case userDescription
        }

        public init(
            identifier: String,
            userDescription: String
            ) {
            self.identifier = identifier
            self.userDescription = userDescription
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            identifier = try container.decode(String.self, forKey: .identifier)
            userDescription = try container.decode(String.self, forKey: .userDescription)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(identifier, forKey: .identifier)
            try container.encode(userDescription, forKey: .userDescription)
        }
    }
}
