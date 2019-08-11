
import Foundation

public extension V3_20 {

    class ActivityLogSectionHead: Codable {
        public let domainType: String?
        public let title: String?
        public let startTime: Date?

        private enum CodingKeys: CodingKey {
            case domainType
            case title
            case startTime
        }

        public init(
            domainType: String?,
            title: String?,
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
            domainType = try container.decodeIfPresent(_Value<String>.self, forKey: .domainType)?._value
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            startTime = try container.decodeIfPresent(_Value<Date>.self, forKey: .startTime)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(domainType, forKey: .domainType)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(startTime, forKey: .startTime)
        }
    }
}
