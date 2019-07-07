
import Foundation

public extension V3_19 {

    class ResultIssueSummaries: Codable {
        public let analyzerWarningSummaries: [IssueSummary]
        public let errorSummaries: [IssueSummary]
        public let testFailureSummaries: [TestFailureIssueSummary]
        public let warningSummaries: [IssueSummary]

        private enum CodingKeys: CodingKey {
            case analyzerWarningSummaries
            case errorSummaries
            case testFailureSummaries
            case warningSummaries
        }

        public init(
            analyzerWarningSummaries: [IssueSummary],
            errorSummaries: [IssueSummary],
            testFailureSummaries: [TestFailureIssueSummary],
            warningSummaries: [IssueSummary]
            ) {
            self.analyzerWarningSummaries = analyzerWarningSummaries
            self.errorSummaries = errorSummaries
            self.testFailureSummaries = testFailureSummaries
            self.warningSummaries = warningSummaries
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            analyzerWarningSummaries = try container.decode([IssueSummary].self, forKey: .analyzerWarningSummaries)
            errorSummaries = try container.decode([IssueSummary].self, forKey: .errorSummaries)
            testFailureSummaries = try container.decode([TestFailureIssueSummary].self, forKey: .testFailureSummaries)
            warningSummaries = try container.decode([IssueSummary].self, forKey: .warningSummaries)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(analyzerWarningSummaries, forKey: .analyzerWarningSummaries)
            try container.encode(errorSummaries, forKey: .errorSummaries)
            try container.encode(testFailureSummaries, forKey: .testFailureSummaries)
            try container.encode(warningSummaries, forKey: .warningSummaries)
        }
    }
}
