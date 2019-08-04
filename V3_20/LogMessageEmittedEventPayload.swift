
import Foundation

public extension V3_20 {

    class LogMessageEmittedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let sectionIndex: Int
        public let message: ActivityLogMessage?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case sectionIndex
            case message
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            sectionIndex: Int,
            message: ActivityLogMessage?
            ) {
            self.resultInfo = resultInfo
            self.sectionIndex = sectionIndex
            self.message = message
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            sectionIndex = try container.decode(Int.self, forKey: .sectionIndex)
            message = try container.decodeIfPresent(ActivityLogMessage.self, forKey: .message)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encode(sectionIndex, forKey: .sectionIndex)
            try container.encodeIfPresent(message, forKey: .message)
        }
    }
}
