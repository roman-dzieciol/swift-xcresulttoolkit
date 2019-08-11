
import Foundation

public extension V3_20 {

    class ActionResult: Codable {
        public let resultName: String?
        public let status: String?
        public let metrics: ResultMetrics?
        public let issues: ResultIssueSummaries?
        public let coverage: CodeCoverageInfo?
        public let timelineRef: Reference?
        public let logRef: Reference?
        public let testsRef: Reference?
        public let diagnosticsRef: Reference?

        private enum CodingKeys: CodingKey {
            case resultName
            case status
            case metrics
            case issues
            case coverage
            case timelineRef
            case logRef
            case testsRef
            case diagnosticsRef
        }

        public init(
            resultName: String?,
            status: String?,
            metrics: ResultMetrics?,
            issues: ResultIssueSummaries?,
            coverage: CodeCoverageInfo?,
            timelineRef: Reference?,
            logRef: Reference?,
            testsRef: Reference?,
            diagnosticsRef: Reference?
            ) {
            self.resultName = resultName
            self.status = status
            self.metrics = metrics
            self.issues = issues
            self.coverage = coverage
            self.timelineRef = timelineRef
            self.logRef = logRef
            self.testsRef = testsRef
            self.diagnosticsRef = diagnosticsRef
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            resultName = try container.decodeIfPresent(_Value<String>.self, forKey: .resultName)?._value
            status = try container.decodeIfPresent(_Value<String>.self, forKey: .status)?._value
            metrics = try container.decodeIfPresent(ResultMetrics.self, forKey: .metrics)
            issues = try container.decodeIfPresent(ResultIssueSummaries.self, forKey: .issues)
            coverage = try container.decodeIfPresent(CodeCoverageInfo.self, forKey: .coverage)
            timelineRef = try container.decodeIfPresent(Reference.self, forKey: .timelineRef)
            logRef = try container.decodeIfPresent(Reference.self, forKey: .logRef)
            testsRef = try container.decodeIfPresent(Reference.self, forKey: .testsRef)
            diagnosticsRef = try container.decodeIfPresent(Reference.self, forKey: .diagnosticsRef)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(resultName, forKey: .resultName)
            try container.encodeIfPresent(status, forKey: .status)
            try container.encodeIfPresent(metrics, forKey: .metrics)
            try container.encodeIfPresent(issues, forKey: .issues)
            try container.encodeIfPresent(coverage, forKey: .coverage)
            try container.encodeIfPresent(timelineRef, forKey: .timelineRef)
            try container.encodeIfPresent(logRef, forKey: .logRef)
            try container.encodeIfPresent(testsRef, forKey: .testsRef)
            try container.encodeIfPresent(diagnosticsRef, forKey: .diagnosticsRef)
        }
    }
}
