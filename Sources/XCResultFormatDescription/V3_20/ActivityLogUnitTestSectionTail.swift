
import Foundation

public extension V3_20 {

    class ActivityLogUnitTestSectionTail: ActivityLogSectionTail {
        public let summary: String?
        public let performanceTestOutput: String?
        public let testsPassedString: String?

        private enum CodingKeys: CodingKey {
            case summary
            case performanceTestOutput
            case testsPassedString
        }

        public init(
            duration: Double?,
            result: String?,
            summary: String?,
            performanceTestOutput: String?,
            testsPassedString: String?
            ) {
            self.summary = summary
            self.performanceTestOutput = performanceTestOutput
            self.testsPassedString = testsPassedString
            super.init(duration: duration, result: result)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            summary = try container.decodeIfPresent(_Value<String>.self, forKey: .summary)?._value
            performanceTestOutput = try container.decodeIfPresent(_Value<String>.self, forKey: .performanceTestOutput)?._value
            testsPassedString = try container.decodeIfPresent(_Value<String>.self, forKey: .testsPassedString)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(summary, forKey: .summary)
            try container.encodeIfPresent(performanceTestOutput, forKey: .performanceTestOutput)
            try container.encodeIfPresent(testsPassedString, forKey: .testsPassedString)
        }
    }
}
