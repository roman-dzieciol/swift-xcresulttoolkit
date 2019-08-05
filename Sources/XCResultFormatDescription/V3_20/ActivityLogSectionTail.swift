
import Foundation

public extension V3_20 {

    class ActivityLogSectionTail: Codable {
        public let duration: Double
        public let result: String?

        private enum CodingKeys: CodingKey {
            case duration
            case result
        }

        public init(
            duration: Double,
            result: String?
            ) {
            self.duration = duration
            self.result = result
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            duration = try container.decode(_Value<Double>.self, forKey: .duration)._value
            result = try container.decodeIfPresent(String.self, forKey: .result)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(duration, forKey: .duration)
            try container.encodeIfPresent(result, forKey: .result)
        }
    }
}
