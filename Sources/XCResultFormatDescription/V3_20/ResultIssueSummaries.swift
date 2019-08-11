
import Foundation

public extension V3_20 {

    class ResultIssueSummaries: Codable {
        public let analyzerWarningSummaries: [IssueSummary]?
        public let errorSummaries: [IssueSummary]?
        public let testFailureSummaries: [TestFailureIssueSummary]?
        public let warningSummaries: [IssueSummary]?

        private enum CodingKeys: CodingKey {
            case analyzerWarningSummaries
            case errorSummaries
            case testFailureSummaries
            case warningSummaries
        }

        public init(
            analyzerWarningSummaries: [IssueSummary]?,
            errorSummaries: [IssueSummary]?,
            testFailureSummaries: [TestFailureIssueSummary]?,
            warningSummaries: [IssueSummary]?
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
            analyzerWarningSummaries = try container.decodeIfPresent(_Values<IssueSummary>.self, forKey: .analyzerWarningSummaries)?._values
            errorSummaries = try container.decodeIfPresent(_Values<IssueSummary>.self, forKey: .errorSummaries)?._values
            testFailureSummaries = try container.decodeIfPresent(_Values<TestFailureIssueSummary>.self, forKey: .testFailureSummaries)?._values
            warningSummaries = try container.decodeIfPresent(_Values<IssueSummary>.self, forKey: .warningSummaries)?._values
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(analyzerWarningSummaries, forKey: .analyzerWarningSummaries)
            try container.encodeIfPresent(errorSummaries, forKey: .errorSummaries)
            try container.encodeIfPresent(testFailureSummaries, forKey: .testFailureSummaries)
            try container.encodeIfPresent(warningSummaries, forKey: .warningSummaries)
        }
    }
}
