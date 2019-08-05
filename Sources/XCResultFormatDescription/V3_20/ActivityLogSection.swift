
import Foundation

public extension V3_20 {

    class ActivityLogSection: Codable {
        public let domainType: String
        public let title: String
        public let startTime: Date?
        public let duration: Double
        public let result: String?
        public let subsections: [ActivityLogSection]
        public let messages: [ActivityLogMessage]

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
            domainType: String,
            title: String,
            startTime: Date?,
            duration: Double,
            result: String?,
            subsections: [ActivityLogSection],
            messages: [ActivityLogMessage]
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
            domainType = try container.decode(String.self, forKey: .domainType)
            title = try container.decode(String.self, forKey: .title)
            startTime = try container.decodeIfPresent(Date.self, forKey: .startTime)
            duration = try container.decode(Double.self, forKey: .duration)
            result = try container.decodeIfPresent(String.self, forKey: .result)
            subsections = try container.decode([ActivityLogSection].self, forKey: .subsections)
            messages = try container.decode([ActivityLogMessage].self, forKey: .messages)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(domainType, forKey: .domainType)
            try container.encode(title, forKey: .title)
            try container.encodeIfPresent(startTime, forKey: .startTime)
            try container.encode(duration, forKey: .duration)
            try container.encodeIfPresent(result, forKey: .result)
            try container.encode(subsections, forKey: .subsections)
            try container.encode(messages, forKey: .messages)
        }
    }
}
