
import Foundation

public extension V3_20 {

    class ActionStartedEventPayload: AnyStreamedEventPayload {
        public let actionInfo: StreamedActionInfo?
        public let head: ActionRecordHead?

        private enum CodingKeys: CodingKey {
            case actionInfo
            case head
        }

        public init(
            actionInfo: StreamedActionInfo?,
            head: ActionRecordHead?
            ) {
            self.actionInfo = actionInfo
            self.head = head
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            actionInfo = try container.decodeIfPresent(StreamedActionInfo.self, forKey: .actionInfo)
            head = try container.decodeIfPresent(ActionRecordHead.self, forKey: .head)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(actionInfo, forKey: .actionInfo)
            try container.encodeIfPresent(head, forKey: .head)
        }
    }
}
