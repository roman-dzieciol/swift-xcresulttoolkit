
import Foundation

public extension V3_20 {

    class ActivityLogUnitTestSection: ActivityLogSection {
        public let testName: String?
        public let suiteName: String?
        public let summary: String?
        public let emittedOutput: String?
        public let performanceTestOutput: String?
        public let testsPassedString: String?
        public let runnablePath: String?
        public let runnableUTI: String?

        private enum CodingKeys: CodingKey {
            case testName
            case suiteName
            case summary
            case emittedOutput
            case performanceTestOutput
            case testsPassedString
            case runnablePath
            case runnableUTI
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            duration: Double?,
            result: String?,
            subsections: [ActivityLogSection]?,
            messages: [ActivityLogMessage]?,
            testName: String?,
            suiteName: String?,
            summary: String?,
            emittedOutput: String?,
            performanceTestOutput: String?,
            testsPassedString: String?,
            runnablePath: String?,
            runnableUTI: String?
            ) {
            self.testName = testName
            self.suiteName = suiteName
            self.summary = summary
            self.emittedOutput = emittedOutput
            self.performanceTestOutput = performanceTestOutput
            self.testsPassedString = testsPassedString
            self.runnablePath = runnablePath
            self.runnableUTI = runnableUTI
            super.init(domainType: domainType, title: title, startTime: startTime, duration: duration, result: result, subsections: subsections, messages: messages)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testName = try container.decodeIfPresent(_Value<String>.self, forKey: .testName)?._value
            suiteName = try container.decodeIfPresent(_Value<String>.self, forKey: .suiteName)?._value
            summary = try container.decodeIfPresent(_Value<String>.self, forKey: .summary)?._value
            emittedOutput = try container.decodeIfPresent(_Value<String>.self, forKey: .emittedOutput)?._value
            performanceTestOutput = try container.decodeIfPresent(_Value<String>.self, forKey: .performanceTestOutput)?._value
            testsPassedString = try container.decodeIfPresent(_Value<String>.self, forKey: .testsPassedString)?._value
            runnablePath = try container.decodeIfPresent(_Value<String>.self, forKey: .runnablePath)?._value
            runnableUTI = try container.decodeIfPresent(_Value<String>.self, forKey: .runnableUTI)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testName, forKey: .testName)
            try container.encodeIfPresent(suiteName, forKey: .suiteName)
            try container.encodeIfPresent(summary, forKey: .summary)
            try container.encodeIfPresent(emittedOutput, forKey: .emittedOutput)
            try container.encodeIfPresent(performanceTestOutput, forKey: .performanceTestOutput)
            try container.encodeIfPresent(testsPassedString, forKey: .testsPassedString)
            try container.encodeIfPresent(runnablePath, forKey: .runnablePath)
            try container.encodeIfPresent(runnableUTI, forKey: .runnableUTI)
        }
    }
}
