
import Foundation

public extension V3_20 {

    class ActionRecordTail: Codable {
        public let endedTime: Date?
        public let buildResult: ActionResult?
        public let actionResult: ActionResult?

        private enum CodingKeys: CodingKey {
            case endedTime
            case buildResult
            case actionResult
        }

        public init(
            endedTime: Date?,
            buildResult: ActionResult?,
            actionResult: ActionResult?
            ) {
            self.endedTime = endedTime
            self.buildResult = buildResult
            self.actionResult = actionResult
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            endedTime = try container.decodeIfPresent(_Value<Date>.self, forKey: .endedTime)?._value
            buildResult = try container.decodeIfPresent(ActionResult.self, forKey: .buildResult)
            actionResult = try container.decodeIfPresent(ActionResult.self, forKey: .actionResult)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(endedTime, forKey: .endedTime)
            try container.encodeIfPresent(buildResult, forKey: .buildResult)
            try container.encodeIfPresent(actionResult, forKey: .actionResult)
        }
    }
}
