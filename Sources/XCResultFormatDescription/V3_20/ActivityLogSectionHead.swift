
import Foundation

public extension V3_20 {

    class ActivityLogSectionHead: Codable {
        public let domainType: String
        public let title: String
        public let startTime: Date?

        private enum CodingKeys: CodingKey {
            case domainType
            case title
            case startTime
        }

        public init(
            domainType: String,
            title: String,
            startTime: Date?
            ) {
            self.domainType = domainType
            self.title = title
            self.startTime = startTime
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            domainType = try container.decode(_Value<String>.self, forKey: .domainType)._value
            title = try container.decode(_Value<String>.self, forKey: .title)._value
            startTime = try container.decodeIfPresent(Date.self, forKey: .startTime)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(domainType, forKey: .domainType)
            try container.encode(title, forKey: .title)
            try container.encodeIfPresent(startTime, forKey: .startTime)
        }
    }
}
