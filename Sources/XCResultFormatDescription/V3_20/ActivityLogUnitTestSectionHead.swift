
import Foundation

public extension V3_20 {

    class ActivityLogUnitTestSectionHead: ActivityLogSectionHead {
        public let testName: String?
        public let suiteName: String?
        public let runnablePath: String?
        public let runnableUTI: String?

        private enum CodingKeys: CodingKey {
            case testName
            case suiteName
            case runnablePath
            case runnableUTI
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            testName: String?,
            suiteName: String?,
            runnablePath: String?,
            runnableUTI: String?
            ) {
            self.testName = testName
            self.suiteName = suiteName
            self.runnablePath = runnablePath
            self.runnableUTI = runnableUTI
            super.init(domainType: domainType, title: title, startTime: startTime)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testName = try container.decodeIfPresent(_Value<String>.self, forKey: .testName)?._value
            suiteName = try container.decodeIfPresent(_Value<String>.self, forKey: .suiteName)?._value
            runnablePath = try container.decodeIfPresent(_Value<String>.self, forKey: .runnablePath)?._value
            runnableUTI = try container.decodeIfPresent(_Value<String>.self, forKey: .runnableUTI)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testName, forKey: .testName)
            try container.encodeIfPresent(suiteName, forKey: .suiteName)
            try container.encodeIfPresent(runnablePath, forKey: .runnablePath)
            try container.encodeIfPresent(runnableUTI, forKey: .runnableUTI)
        }
    }
}
