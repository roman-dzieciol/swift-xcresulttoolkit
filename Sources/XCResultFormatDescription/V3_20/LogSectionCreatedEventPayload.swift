
import Foundation

public extension V3_20 {

    class LogSectionCreatedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let sectionIndex: Int?
        public let head: ActivityLogSectionHead?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case sectionIndex
            case head
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            sectionIndex: Int?,
            head: ActivityLogSectionHead?
            ) {
            self.resultInfo = resultInfo
            self.sectionIndex = sectionIndex
            self.head = head
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            sectionIndex = try container.decodeIfPresent(_Value<Int>.self, forKey: .sectionIndex)?._value
            head = try container.decodeIfPresent(ActivityLogSectionHead.self, forKey: .head)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encodeIfPresent(sectionIndex, forKey: .sectionIndex)
            try container.encodeIfPresent(head, forKey: .head)
        }
    }
}
