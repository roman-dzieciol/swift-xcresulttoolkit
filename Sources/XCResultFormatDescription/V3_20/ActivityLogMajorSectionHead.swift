
import Foundation

public extension V3_20 {

    class ActivityLogMajorSectionHead: ActivityLogSectionHead {
        public let subtitle: String?

        private enum CodingKeys: CodingKey {
            case subtitle
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            subtitle: String?
            ) {
            self.subtitle = subtitle
            super.init(domainType: domainType, title: title, startTime: startTime)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            subtitle = try container.decodeIfPresent(_Value<String>.self, forKey: .subtitle)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(subtitle, forKey: .subtitle)
        }
    }
}
