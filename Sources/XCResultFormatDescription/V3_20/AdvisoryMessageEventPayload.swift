
import Foundation

public extension V3_20 {

    class AdvisoryMessageEventPayload: AnyStreamedEventPayload {
        public let message: String
        public let progress: Double?

        private enum CodingKeys: CodingKey {
            case message
            case progress
        }

        public init(
            message: String,
            progress: Double?
            ) {
            self.message = message
            self.progress = progress
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            message = try container.decode(_Value<String>.self, forKey: .message)._value
            progress = try container.decodeIfPresent(Double.self, forKey: .progress)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(message, forKey: .message)
            try container.encodeIfPresent(progress, forKey: .progress)
        }
    }
}
