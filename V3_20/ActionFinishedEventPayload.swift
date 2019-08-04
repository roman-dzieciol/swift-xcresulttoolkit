
import Foundation

public extension V3_20 {

    class ActionFinishedEventPayload: AnyStreamedEventPayload {
        public let actionInfo: StreamedActionInfo?
        public let tail: ActionRecordTail?

        private enum CodingKeys: CodingKey {
            case actionInfo
            case tail
        }

        public init(
            actionInfo: StreamedActionInfo?,
            tail: ActionRecordTail?
            ) {
            self.actionInfo = actionInfo
            self.tail = tail
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            actionInfo = try container.decodeIfPresent(StreamedActionInfo.self, forKey: .actionInfo)
            tail = try container.decodeIfPresent(ActionRecordTail.self, forKey: .tail)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(actionInfo, forKey: .actionInfo)
            try container.encodeIfPresent(tail, forKey: .tail)
        }
    }
}
