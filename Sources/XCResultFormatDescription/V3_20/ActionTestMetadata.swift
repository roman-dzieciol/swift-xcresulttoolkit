
import Foundation

public extension V3_20 {

    class ActionTestMetadata: ActionTestSummaryIdentifiableObject {
        public let testStatus: String?
        public let duration: Double?
        public let summaryRef: Reference?
        public let performanceMetricsCount: Int?
        public let failureSummariesCount: Int?
        public let activitySummariesCount: Int?

        private enum CodingKeys: CodingKey {
            case testStatus
            case duration
            case summaryRef
            case performanceMetricsCount
            case failureSummariesCount
            case activitySummariesCount
        }

        public init(
            name: String?,
            identifier: String?,
            testStatus: String?,
            duration: Double?,
            summaryRef: Reference?,
            performanceMetricsCount: Int?,
            failureSummariesCount: Int?,
            activitySummariesCount: Int?
            ) {
            self.testStatus = testStatus
            self.duration = duration
            self.summaryRef = summaryRef
            self.performanceMetricsCount = performanceMetricsCount
            self.failureSummariesCount = failureSummariesCount
            self.activitySummariesCount = activitySummariesCount
            super.init(name: name, identifier: identifier)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testStatus = try container.decodeIfPresent(_Value<String>.self, forKey: .testStatus)?._value
            duration = try container.decodeIfPresent(_Value<Double>.self, forKey: .duration)?._value
            summaryRef = try container.decodeIfPresent(Reference.self, forKey: .summaryRef)
            performanceMetricsCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .performanceMetricsCount)?._value
            failureSummariesCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .failureSummariesCount)?._value
            activitySummariesCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .activitySummariesCount)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testStatus, forKey: .testStatus)
            try container.encodeIfPresent(duration, forKey: .duration)
            try container.encodeIfPresent(summaryRef, forKey: .summaryRef)
            try container.encodeIfPresent(performanceMetricsCount, forKey: .performanceMetricsCount)
            try container.encodeIfPresent(failureSummariesCount, forKey: .failureSummariesCount)
            try container.encodeIfPresent(activitySummariesCount, forKey: .activitySummariesCount)
        }
    }
}
