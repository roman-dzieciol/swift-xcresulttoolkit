
import Foundation

public extension V3_20 {

    class ActionRecord: Codable {
        public let schemeCommandName: String?
        public let schemeTaskName: String?
        public let title: String?
        public let startedTime: Date?
        public let endedTime: Date?
        public let runDestination: ActionRunDestinationRecord?
        public let buildResult: ActionResult?
        public let actionResult: ActionResult?

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
            schemeCommandName: String?,
            schemeTaskName: String?,
            title: String?,
            startedTime: Date?,
            endedTime: Date?,
            runDestination: ActionRunDestinationRecord?,
            buildResult: ActionResult?,
            actionResult: ActionResult?
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
            schemeCommandName = try container.decodeIfPresent(_Value<String>.self, forKey: .schemeCommandName)?._value
            schemeTaskName = try container.decodeIfPresent(_Value<String>.self, forKey: .schemeTaskName)?._value
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            startedTime = try container.decodeIfPresent(_Value<Date>.self, forKey: .startedTime)?._value
            endedTime = try container.decodeIfPresent(_Value<Date>.self, forKey: .endedTime)?._value
            runDestination = try container.decodeIfPresent(ActionRunDestinationRecord.self, forKey: .runDestination)
            buildResult = try container.decodeIfPresent(ActionResult.self, forKey: .buildResult)
            actionResult = try container.decodeIfPresent(ActionResult.self, forKey: .actionResult)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(schemeCommandName, forKey: .schemeCommandName)
            try container.encodeIfPresent(schemeTaskName, forKey: .schemeTaskName)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(startedTime, forKey: .startedTime)
            try container.encodeIfPresent(endedTime, forKey: .endedTime)
            try container.encodeIfPresent(runDestination, forKey: .runDestination)
            try container.encodeIfPresent(buildResult, forKey: .buildResult)
            try container.encodeIfPresent(actionResult, forKey: .actionResult)
        }
    }
}
