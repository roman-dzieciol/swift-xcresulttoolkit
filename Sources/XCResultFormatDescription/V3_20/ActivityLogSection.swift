
import Foundation

public extension V3_20 {

    class ActivityLogSection: Codable {
        public let domainType: String?
        public let title: String?
        public let startTime: Date?
        public let duration: Double?
        public let result: String?
        public let subsections: [ActivityLogSection]?
        public let messages: [ActivityLogMessage]?

        private enum CodingKeys: CodingKey {
            case domainType
            case title
            case startTime
            case duration
            case result
            case subsections
            case messages
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            duration: Double?,
            result: String?,
            subsections: [ActivityLogSection]?,
            messages: [ActivityLogMessage]?
            ) {
            self.domainType = domainType
            self.title = title
            self.startTime = startTime
            self.duration = duration
            self.result = result
            self.subsections = subsections
            self.messages = messages
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            domainType = try container.decodeIfPresent(_Value<String>.self, forKey: .domainType)?._value
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            startTime = try container.decodeIfPresent(_Value<Date>.self, forKey: .startTime)?._value
            duration = try container.decodeIfPresent(_Value<Double>.self, forKey: .duration)?._value
            result = try container.decodeIfPresent(_Value<String>.self, forKey: .result)?._value
            subsections = try container.decodeIfPresent(_Values<ActivityLogSection>.self, forKey: .subsections)?._values
            messages = try container.decodeIfPresent(_Values<ActivityLogMessage>.self, forKey: .messages)?._values
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(domainType, forKey: .domainType)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(startTime, forKey: .startTime)
            try container.encodeIfPresent(duration, forKey: .duration)
            try container.encodeIfPresent(result, forKey: .result)
            try container.encodeIfPresent(subsections, forKey: .subsections)
            try container.encodeIfPresent(messages, forKey: .messages)
        }
    }
}
