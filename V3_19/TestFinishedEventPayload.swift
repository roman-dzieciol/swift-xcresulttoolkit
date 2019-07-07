
import Foundation

public extension V3_19 {

    class TestFinishedEventPayload: AnyStreamedEventPayload {
        public let test: ActionTestMetadata?

        private enum CodingKeys: CodingKey {
            case test
        }

        public init(
            test: ActionTestMetadata?
            ) {
            self.test = test
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            test = try container.decodeIfPresent(ActionTestMetadata.self, forKey: .test)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(test, forKey: .test)
        }
    }
}
