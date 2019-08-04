
import Foundation

public extension V3_20 {

    class ActionRecordTail: Codable {
        public let endedTime: Date
        public let buildResult: ActionResult
        public let actionResult: ActionResult

        private enum CodingKeys: CodingKey {
            case endedTime
            case buildResult
            case actionResult
        }

        public init(
            endedTime: Date,
            buildResult: ActionResult,
            actionResult: ActionResult
            ) {
            self.endedTime = endedTime
            self.buildResult = buildResult
            self.actionResult = actionResult
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            endedTime = try container.decode(Date.self, forKey: .endedTime)
            buildResult = try container.decode(ActionResult.self, forKey: .buildResult)
            actionResult = try container.decode(ActionResult.self, forKey: .actionResult)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(endedTime, forKey: .endedTime)
            try container.encode(buildResult, forKey: .buildResult)
            try container.encode(actionResult, forKey: .actionResult)
        }
    }
}
