
import Foundation

public extension V3_20 {

    class ActionTestSummaryGroup: ActionTestSummaryIdentifiableObject {
        public let duration: Double
        public let subtests: [ActionTestSummaryIdentifiableObject]

        private enum CodingKeys: CodingKey {
            case duration
            case subtests
        }

        public init(
            name: String?,
            identifier: String?,
            duration: Double,
            subtests: [ActionTestSummaryIdentifiableObject]
            ) {
            self.duration = duration
            self.subtests = subtests
            super.init(name: name, identifier: identifier)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            duration = try container.decode(_Value<Double>.self, forKey: .duration)._value
            subtests = try container.decode([ActionTestSummaryIdentifiableObject].self, forKey: .subtests)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(duration, forKey: .duration)
            try container.encode(subtests, forKey: .subtests)
        }
    }
}
