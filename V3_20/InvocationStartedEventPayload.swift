
import Foundation

public extension V3_20 {

    class InvocationStartedEventPayload: AnyStreamedEventPayload {
        public let metadata: ActionsInvocationMetadata?

        private enum CodingKeys: CodingKey {
            case metadata
        }

        public init(
            metadata: ActionsInvocationMetadata?
            ) {
            self.metadata = metadata
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            metadata = try container.decodeIfPresent(ActionsInvocationMetadata.self, forKey: .metadata)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(metadata, forKey: .metadata)
        }
    }
}
