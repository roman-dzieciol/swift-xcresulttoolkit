
import Foundation

public extension V3_20 {

    class ActionsInvocationMetadata: Codable {
        public let creatingWorkspaceFilePath: String
        public let uniqueIdentifier: String
        public let schemeIdentifier: EntityIdentifier?

        private enum CodingKeys: CodingKey {
            case creatingWorkspaceFilePath
            case uniqueIdentifier
            case schemeIdentifier
        }

        public init(
            creatingWorkspaceFilePath: String,
            uniqueIdentifier: String,
            schemeIdentifier: EntityIdentifier?
            ) {
            self.creatingWorkspaceFilePath = creatingWorkspaceFilePath
            self.uniqueIdentifier = uniqueIdentifier
            self.schemeIdentifier = schemeIdentifier
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            creatingWorkspaceFilePath = try container.decode(_Value<String>.self, forKey: .creatingWorkspaceFilePath)._value
            uniqueIdentifier = try container.decode(_Value<String>.self, forKey: .uniqueIdentifier)._value
            schemeIdentifier = try container.decodeIfPresent(EntityIdentifier.self, forKey: .schemeIdentifier)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(creatingWorkspaceFilePath, forKey: .creatingWorkspaceFilePath)
            try container.encode(uniqueIdentifier, forKey: .uniqueIdentifier)
            try container.encodeIfPresent(schemeIdentifier, forKey: .schemeIdentifier)
        }
    }
}
