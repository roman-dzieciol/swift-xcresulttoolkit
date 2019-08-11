
import Foundation

public extension V3_20 {

    class StreamedEvent: Codable {
        public let name: String?
        public let structuredPayload: AnyStreamedEventPayload?

        private enum CodingKeys: CodingKey {
            case name
            case structuredPayload
        }

        public init(
            name: String?,
            structuredPayload: AnyStreamedEventPayload?
            ) {
            self.name = name
            self.structuredPayload = structuredPayload
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decodeIfPresent(_Value<String>.self, forKey: .name)?._value
            structuredPayload = try container.decodeIfPresent(AnyStreamedEventPayload.self, forKey: .structuredPayload)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(structuredPayload, forKey: .structuredPayload)
        }
    }
}
