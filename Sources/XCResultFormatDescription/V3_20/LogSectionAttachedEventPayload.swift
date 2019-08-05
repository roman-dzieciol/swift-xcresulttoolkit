
import Foundation

public extension V3_20 {

    class LogSectionAttachedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let parentSectionIndex: Int
        public let childSectionIndex: Int

        private enum CodingKeys: CodingKey {
            case resultInfo
            case parentSectionIndex
            case childSectionIndex
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            parentSectionIndex: Int,
            childSectionIndex: Int
            ) {
            self.resultInfo = resultInfo
            self.parentSectionIndex = parentSectionIndex
            self.childSectionIndex = childSectionIndex
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            parentSectionIndex = try container.decode(_Value<Int>.self, forKey: .parentSectionIndex)._value
            childSectionIndex = try container.decode(_Value<Int>.self, forKey: .childSectionIndex)._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encode(parentSectionIndex, forKey: .parentSectionIndex)
            try container.encode(childSectionIndex, forKey: .childSectionIndex)
        }
    }
}
