
import Foundation

public extension V3_19 {

    class ActionRecord: Codable {
        public let schemeCommandName: String
        public let schemeTaskName: String
        public let title: String?
        public let startedTime: Date
        public let endedTime: Date
        public let runDestination: ActionRunDestinationRecord
        public let buildResult: ActionResult
        public let actionResult: ActionResult

        private enum CodingKeys: CodingKey {
            case schemeCommandName
            case schemeTaskName
            case title
            case startedTime
            case endedTime
            case runDestination
            case buildResult
            case actionResult
        }

        public init(
            schemeCommandName: String,
            schemeTaskName: String,
            title: String?,
            startedTime: Date,
            endedTime: Date,
            runDestination: ActionRunDestinationRecord,
            buildResult: ActionResult,
            actionResult: ActionResult
            ) {
            self.schemeCommandName = schemeCommandName
            self.schemeTaskName = schemeTaskName
            self.title = title
            self.startedTime = startedTime
            self.endedTime = endedTime
            self.runDestination = runDestination
            self.buildResult = buildResult
            self.actionResult = actionResult
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            schemeCommandName = try container.decode(String.self, forKey: .schemeCommandName)
            schemeTaskName = try container.decode(String.self, forKey: .schemeTaskName)
            title = try container.decodeIfPresent(String.self, forKey: .title)
            startedTime = try container.decode(Date.self, forKey: .startedTime)
            endedTime = try container.decode(Date.self, forKey: .endedTime)
            runDestination = try container.decode(ActionRunDestinationRecord.self, forKey: .runDestination)
            buildResult = try container.decode(ActionResult.self, forKey: .buildResult)
            actionResult = try container.decode(ActionResult.self, forKey: .actionResult)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(schemeCommandName, forKey: .schemeCommandName)
            try container.encode(schemeTaskName, forKey: .schemeTaskName)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encode(startedTime, forKey: .startedTime)
            try container.encode(endedTime, forKey: .endedTime)
            try container.encode(runDestination, forKey: .runDestination)
            try container.encode(buildResult, forKey: .buildResult)
            try container.encode(actionResult, forKey: .actionResult)
        }
    }
}
