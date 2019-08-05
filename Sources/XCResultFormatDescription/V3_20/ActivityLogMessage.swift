
import Foundation

public extension V3_20 {

    class ActivityLogMessage: Codable {
        public let type: String
        public let title: String
        public let shortTitle: String?
        public let category: String?
        public let location: DocumentLocation?
        public let annotations: [ActivityLogMessageAnnotation]

        private enum CodingKeys: CodingKey {
            case type
            case title
            case shortTitle
            case category
            case location
            case annotations
        }

        public init(
            type: String,
            title: String,
            shortTitle: String?,
            category: String?,
            location: DocumentLocation?,
            annotations: [ActivityLogMessageAnnotation]
            ) {
            self.type = type
            self.title = title
            self.shortTitle = shortTitle
            self.category = category
            self.location = location
            self.annotations = annotations
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = try container.decode(_Value<String>.self, forKey: .type)._value
            title = try container.decode(_Value<String>.self, forKey: .title)._value
            shortTitle = try container.decodeIfPresent(String.self, forKey: .shortTitle)
            category = try container.decodeIfPresent(String.self, forKey: .category)
            location = try container.decodeIfPresent(DocumentLocation.self, forKey: .location)
            annotations = try container.decode([ActivityLogMessageAnnotation].self, forKey: .annotations)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(title, forKey: .title)
            try container.encodeIfPresent(shortTitle, forKey: .shortTitle)
            try container.encodeIfPresent(category, forKey: .category)
            try container.encodeIfPresent(location, forKey: .location)
            try container.encode(annotations, forKey: .annotations)
        }
    }
}
