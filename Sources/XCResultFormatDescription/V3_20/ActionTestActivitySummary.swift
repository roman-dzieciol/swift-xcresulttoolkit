
import Foundation

public extension V3_20 {

    class ActionTestActivitySummary: Codable {
        public let title: String
        public let activityType: String
        public let uuid: String
        public let start: Date?
        public let finish: Date?
        public let attachments: [ActionTestAttachment]
        public let subactivities: [ActionTestActivitySummary]

        private enum CodingKeys: CodingKey {
            case title
            case activityType
            case uuid
            case start
            case finish
            case attachments
            case subactivities
        }

        public init(
            title: String,
            activityType: String,
            uuid: String,
            start: Date?,
            finish: Date?,
            attachments: [ActionTestAttachment],
            subactivities: [ActionTestActivitySummary]
            ) {
            self.title = title
            self.activityType = activityType
            self.uuid = uuid
            self.start = start
            self.finish = finish
            self.attachments = attachments
            self.subactivities = subactivities
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(_Value<String>.self, forKey: .title)._value
            activityType = try container.decode(_Value<String>.self, forKey: .activityType)._value
            uuid = try container.decode(_Value<String>.self, forKey: .uuid)._value
            start = try container.decodeIfPresent(Date.self, forKey: .start)
            finish = try container.decodeIfPresent(Date.self, forKey: .finish)
            attachments = try container.decode([ActionTestAttachment].self, forKey: .attachments)
            subactivities = try container.decode([ActionTestActivitySummary].self, forKey: .subactivities)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(title, forKey: .title)
            try container.encode(activityType, forKey: .activityType)
            try container.encode(uuid, forKey: .uuid)
            try container.encodeIfPresent(start, forKey: .start)
            try container.encodeIfPresent(finish, forKey: .finish)
            try container.encode(attachments, forKey: .attachments)
            try container.encode(subactivities, forKey: .subactivities)
        }
    }
}
