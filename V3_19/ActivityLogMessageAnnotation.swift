
import Foundation

public extension V3_19 {

    class ActivityLogMessageAnnotation: Codable {
        public let title: String
        public let location: DocumentLocation?

        private enum CodingKeys: CodingKey {
            case title
            case location
        }

        public init(
            title: String,
            location: DocumentLocation?
            ) {
            self.title = title
            self.location = location
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            location = try container.decodeIfPresent(DocumentLocation.self, forKey: .location)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(title, forKey: .title)
            try container.encodeIfPresent(location, forKey: .location)
        }
    }
}
