
import Foundation

public extension V3_19 {

    class ActionResult: Codable {
        public let resultName: String
        public let status: String
        public let metrics: ResultMetrics
        public let issues: ResultIssueSummaries
        public let coverage: CodeCoverageInfo
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
            resultName: String,
            status: String,
            metrics: ResultMetrics,
            issues: ResultIssueSummaries,
            coverage: CodeCoverageInfo,
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
            resultName = try container.decode(String.self, forKey: .resultName)
            status = try container.decode(String.self, forKey: .status)
            metrics = try container.decode(ResultMetrics.self, forKey: .metrics)
            issues = try container.decode(ResultIssueSummaries.self, forKey: .issues)
            coverage = try container.decode(CodeCoverageInfo.self, forKey: .coverage)
            timelineRef = try container.decodeIfPresent(Reference.self, forKey: .timelineRef)
            logRef = try container.decodeIfPresent(Reference.self, forKey: .logRef)
            testsRef = try container.decodeIfPresent(Reference.self, forKey: .testsRef)
            diagnosticsRef = try container.decodeIfPresent(Reference.self, forKey: .diagnosticsRef)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(resultName, forKey: .resultName)
            try container.encode(status, forKey: .status)
            try container.encode(metrics, forKey: .metrics)
            try container.encode(issues, forKey: .issues)
            try container.encode(coverage, forKey: .coverage)
            try container.encodeIfPresent(timelineRef, forKey: .timelineRef)
            try container.encodeIfPresent(logRef, forKey: .logRef)
            try container.encodeIfPresent(testsRef, forKey: .testsRef)
            try container.encodeIfPresent(diagnosticsRef, forKey: .diagnosticsRef)
        }
    }
}
