
import Foundation

public extension V3_20 {

    class ActionRecordHead: Codable {
        public let schemeCommandName: String
        public let schemeTaskName: String
        public let title: String?
        public let startedTime: Date
        public let runDestination: ActionRunDestinationRecord

        private enum CodingKeys: CodingKey {
            case schemeCommandName
            case schemeTaskName
            case title
            case startedTime
            case runDestination
        }

        public init(
            schemeCommandName: String,
            schemeTaskName: String,
            title: String?,
            startedTime: Date,
            runDestination: ActionRunDestinationRecord
            ) {
            self.schemeCommandName = schemeCommandName
            self.schemeTaskName = schemeTaskName
            self.title = title
            self.startedTime = startedTime
            self.runDestination = runDestination
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            schemeCommandName = try container.decode(_Value<String>.self, forKey: .schemeCommandName)._value
            schemeTaskName = try container.decode(_Value<String>.self, forKey: .schemeTaskName)._value
            title = try container.decodeIfPresent(String.self, forKey: .title)
            startedTime = try container.decode(_Value<Date>.self, forKey: .startedTime)._value
            runDestination = try container.decode(ActionRunDestinationRecord.self, forKey: .runDestination)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(schemeCommandName, forKey: .schemeCommandName)
            try container.encode(schemeTaskName, forKey: .schemeTaskName)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encode(startedTime, forKey: .startedTime)
            try container.encode(runDestination, forKey: .runDestination)
        }
    }
}
