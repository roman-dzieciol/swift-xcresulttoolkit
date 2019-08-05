
import Foundation

public extension V3_20 {

    class EntityIdentifier: Codable {
        public let entityName: String
        public let containerName: String
        public let entityType: String
        public let sharedState: String

        private enum CodingKeys: CodingKey {
            case entityName
            case containerName
            case entityType
            case sharedState
        }

        public init(
            entityName: String,
            containerName: String,
            entityType: String,
            sharedState: String
            ) {
            self.entityName = entityName
            self.containerName = containerName
            self.entityType = entityType
            self.sharedState = sharedState
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            entityName = try container.decode(_Value<String>.self, forKey: .entityName)._value
            containerName = try container.decode(_Value<String>.self, forKey: .containerName)._value
            entityType = try container.decode(_Value<String>.self, forKey: .entityType)._value
            sharedState = try container.decode(_Value<String>.self, forKey: .sharedState)._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(entityName, forKey: .entityName)
            try container.encode(containerName, forKey: .containerName)
            try container.encode(entityType, forKey: .entityType)
            try container.encode(sharedState, forKey: .sharedState)
        }
    }
}
