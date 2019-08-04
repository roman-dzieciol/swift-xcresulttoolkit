
import Foundation

public extension V3_20 {

    class TestFinishedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let test: ActionTestMetadata?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case test
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            test: ActionTestMetadata?
            ) {
            self.resultInfo = resultInfo
            self.test = test
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            test = try container.decodeIfPresent(ActionTestMetadata.self, forKey: .test)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encodeIfPresent(test, forKey: .test)
        }
    }
}
