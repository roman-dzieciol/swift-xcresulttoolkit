
import Foundation

public extension V3_20 {

    class ActionTestSummary: ActionTestSummaryIdentifiableObject {
        public let testStatus: String
        public let duration: Double
        public let performanceMetrics: [ActionTestPerformanceMetricSummary]
        public let failureSummaries: [ActionTestFailureSummary]
        public let activitySummaries: [ActionTestActivitySummary]

        private enum CodingKeys: CodingKey {
            case testStatus
            case duration
            case performanceMetrics
            case failureSummaries
            case activitySummaries
        }

        public init(
            name: String?,
            identifier: String?,
            testStatus: String,
            duration: Double,
            performanceMetrics: [ActionTestPerformanceMetricSummary],
            failureSummaries: [ActionTestFailureSummary],
            activitySummaries: [ActionTestActivitySummary]
            ) {
            self.testStatus = testStatus
            self.duration = duration
            self.performanceMetrics = performanceMetrics
            self.failureSummaries = failureSummaries
            self.activitySummaries = activitySummaries
            super.init(name: name, identifier: identifier)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testStatus = try container.decode(_Value<String>.self, forKey: .testStatus)._value
            duration = try container.decode(_Value<Double>.self, forKey: .duration)._value
            performanceMetrics = try container.decode([ActionTestPerformanceMetricSummary].self, forKey: .performanceMetrics)
            failureSummaries = try container.decode([ActionTestFailureSummary].self, forKey: .failureSummaries)
            activitySummaries = try container.decode([ActionTestActivitySummary].self, forKey: .activitySummaries)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(testStatus, forKey: .testStatus)
            try container.encode(duration, forKey: .duration)
            try container.encode(performanceMetrics, forKey: .performanceMetrics)
            try container.encode(failureSummaries, forKey: .failureSummaries)
            try container.encode(activitySummaries, forKey: .activitySummaries)
        }
    }
}
