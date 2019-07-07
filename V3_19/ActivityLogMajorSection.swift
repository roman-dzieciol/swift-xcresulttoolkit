
import Foundation

public extension V3_19 {

    class ActivityLogMajorSection: ActivityLogSection {
        public let subtitle: String

        private enum CodingKeys: CodingKey {
            case subtitle
        }

        public init(
            domainType: String,
            title: String,
            startTime: Date?,
            duration: Double,
            result: String?,
            subsections: [ActivityLogSection],
            messages: [ActivityLogMessage],
            subtitle: String
            ) {
            self.subtitle = subtitle
            super.init(domainType: domainType, title: title, startTime: startTime, duration: duration, result: result, subsections: subsections, messages: messages)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            subtitle = try container.decode(String.self, forKey: .subtitle)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(subtitle, forKey: .subtitle)
        }
    }
}
