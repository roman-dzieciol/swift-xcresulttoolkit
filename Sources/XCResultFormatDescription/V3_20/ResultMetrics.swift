
import Foundation

public extension V3_20 {

    class ResultMetrics: Codable {
        public let analyzerWarningCount: Int
        public let errorCount: Int
        public let testsCount: Int
        public let testsFailedCount: Int
        public let warningCount: Int

        private enum CodingKeys: CodingKey {
            case analyzerWarningCount
            case errorCount
            case testsCount
            case testsFailedCount
            case warningCount
        }

        public init(
            analyzerWarningCount: Int,
            errorCount: Int,
            testsCount: Int,
            testsFailedCount: Int,
            warningCount: Int
            ) {
            self.analyzerWarningCount = analyzerWarningCount
            self.errorCount = errorCount
            self.testsCount = testsCount
            self.testsFailedCount = testsFailedCount
            self.warningCount = warningCount
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            analyzerWarningCount = try container.decode(Int.self, forKey: .analyzerWarningCount)
            errorCount = try container.decode(Int.self, forKey: .errorCount)
            testsCount = try container.decode(Int.self, forKey: .testsCount)
            testsFailedCount = try container.decode(Int.self, forKey: .testsFailedCount)
            warningCount = try container.decode(Int.self, forKey: .warningCount)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(analyzerWarningCount, forKey: .analyzerWarningCount)
            try container.encode(errorCount, forKey: .errorCount)
            try container.encode(testsCount, forKey: .testsCount)
            try container.encode(testsFailedCount, forKey: .testsFailedCount)
            try container.encode(warningCount, forKey: .warningCount)
        }
    }
}
