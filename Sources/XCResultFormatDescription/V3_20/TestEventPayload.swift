
import Foundation

public extension V3_20 {

    class TestEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let testIdentifier: ActionTestSummaryIdentifiableObject?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case testIdentifier
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            testIdentifier: ActionTestSummaryIdentifiableObject?
            ) {
            self.resultInfo = resultInfo
            self.testIdentifier = testIdentifier
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            testIdentifier = try container.decodeIfPresent(ActionTestSummaryIdentifiableObject.self, forKey: .testIdentifier)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encodeIfPresent(testIdentifier, forKey: .testIdentifier)
        }
    }
}
