
import Foundation

public extension V3_19 {

    class TestEventPayload: AnyStreamedEventPayload {
        public let testIdentifier: ActionTestSummaryIdentifiableObject?

        private enum CodingKeys: CodingKey {
            case testIdentifier
        }

        public init(
            testIdentifier: ActionTestSummaryIdentifiableObject?
            ) {
            self.testIdentifier = testIdentifier
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testIdentifier = try container.decodeIfPresent(ActionTestSummaryIdentifiableObject.self, forKey: .testIdentifier)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testIdentifier, forKey: .testIdentifier)
        }
    }
}
