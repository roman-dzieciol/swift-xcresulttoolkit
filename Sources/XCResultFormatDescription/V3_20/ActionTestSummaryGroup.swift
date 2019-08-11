
import Foundation

public extension V3_20 {

    class ActionTestSummaryGroup: ActionTestSummaryIdentifiableObject {
        public let duration: Double?
        public let subtests: [ActionTestSummaryIdentifiableObject]?

        private enum CodingKeys: CodingKey {
            case duration
            case subtests
        }

        public init(
            name: String?,
            identifier: String?,
            duration: Double?,
            subtests: [ActionTestSummaryIdentifiableObject]?
            ) {
            self.duration = duration
            self.subtests = subtests
            super.init(name: name, identifier: identifier)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            duration = try container.decodeIfPresent(_Value<Double>.self, forKey: .duration)?._value
            subtests = try container.decodeIfPresent(_Values<ActionTestSummaryIdentifiableObject>.self, forKey: .subtests)?._values
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(duration, forKey: .duration)
            try container.encodeIfPresent(subtests, forKey: .subtests)
        }
    }
}
