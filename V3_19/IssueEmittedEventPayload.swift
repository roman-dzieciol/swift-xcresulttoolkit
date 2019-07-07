
import Foundation

public extension V3_19 {

    class IssueEmittedEventPayload: AnyStreamedEventPayload {
        public let issue: IssueSummary?
        public let severity: String?

        private enum CodingKeys: CodingKey {
            case issue
            case severity
        }

        public init(
            issue: IssueSummary?,
            severity: String?
            ) {
            self.issue = issue
            self.severity = severity
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            issue = try container.decodeIfPresent(IssueSummary.self, forKey: .issue)
            severity = try container.decodeIfPresent(String.self, forKey: .severity)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(issue, forKey: .issue)
            try container.encodeIfPresent(severity, forKey: .severity)
        }
    }
}
