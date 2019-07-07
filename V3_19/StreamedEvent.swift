
import Foundation

public extension V3_19 {

    class StreamedEvent: Codable {
        public let name: String
        public let structuredPayload: AnyStreamedEventPayload?

        private enum CodingKeys: CodingKey {
            case name
            case structuredPayload
        }

        public init(
            name: String,
            structuredPayload: AnyStreamedEventPayload?
            ) {
            self.name = name
            self.structuredPayload = structuredPayload
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            structuredPayload = try container.decodeIfPresent(AnyStreamedEventPayload.self, forKey: .structuredPayload)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encodeIfPresent(structuredPayload, forKey: .structuredPayload)
        }
    }
}
