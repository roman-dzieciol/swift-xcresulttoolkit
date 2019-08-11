
import Foundation

public extension V3_20 {

    class LogSectionClosedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let sectionIndex: Int?
        public let tail: ActivityLogSectionTail?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case sectionIndex
            case tail
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            sectionIndex: Int?,
            tail: ActivityLogSectionTail?
            ) {
            self.resultInfo = resultInfo
            self.sectionIndex = sectionIndex
            self.tail = tail
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            sectionIndex = try container.decodeIfPresent(_Value<Int>.self, forKey: .sectionIndex)?._value
            tail = try container.decodeIfPresent(ActivityLogSectionTail.self, forKey: .tail)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encodeIfPresent(sectionIndex, forKey: .sectionIndex)
            try container.encodeIfPresent(tail, forKey: .tail)
        }
    }
}
