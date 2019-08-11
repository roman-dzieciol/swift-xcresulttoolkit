
import Foundation

public extension V3_20 {

    class ActivityLogMessage: Codable {
        public let type: String?
        public let title: String?
        public let shortTitle: String?
        public let category: String?
        public let location: DocumentLocation?
        public let annotations: [ActivityLogMessageAnnotation]?

        private enum CodingKeys: CodingKey {
            case type
            case title
            case shortTitle
            case category
            case location
            case annotations
        }

        public init(
            type: String?,
            title: String?,
            shortTitle: String?,
            category: String?,
            location: DocumentLocation?,
            annotations: [ActivityLogMessageAnnotation]?
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
            type = try container.decodeIfPresent(_Value<String>.self, forKey: .type)?._value
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            shortTitle = try container.decodeIfPresent(_Value<String>.self, forKey: .shortTitle)?._value
            category = try container.decodeIfPresent(_Value<String>.self, forKey: .category)?._value
            location = try container.decodeIfPresent(DocumentLocation.self, forKey: .location)
            annotations = try container.decodeIfPresent(_Values<ActivityLogMessageAnnotation>.self, forKey: .annotations)?._values
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(type, forKey: .type)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(shortTitle, forKey: .shortTitle)
            try container.encodeIfPresent(category, forKey: .category)
            try container.encodeIfPresent(location, forKey: .location)
            try container.encodeIfPresent(annotations, forKey: .annotations)
        }
    }
}
