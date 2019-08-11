
import Foundation

public extension V3_20 {

    class IssueEmittedEventPayload: AnyStreamedEventPayload {
        public let resultInfo: StreamedActionResultInfo?
        public let issue: IssueSummary?
        public let severity: String?

        private enum CodingKeys: CodingKey {
            case resultInfo
            case issue
            case severity
        }

        public init(
            resultInfo: StreamedActionResultInfo?,
            issue: IssueSummary?,
            severity: String?
            ) {
            self.resultInfo = resultInfo
            self.issue = issue
            self.severity = severity
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultInfo = try container.decodeIfPresent(StreamedActionResultInfo.self, forKey: .resultInfo)
            issue = try container.decodeIfPresent(IssueSummary.self, forKey: .issue)
            severity = try container.decodeIfPresent(_Value<String>.self, forKey: .severity)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultInfo, forKey: .resultInfo)
            try container.encodeIfPresent(issue, forKey: .issue)
            try container.encodeIfPresent(severity, forKey: .severity)
        }
    }
}
