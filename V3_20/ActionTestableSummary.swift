
import Foundation

public extension V3_20 {

    class ActionTestableSummary: ActionAbstractTestSummary {
        public let projectRelativePath: String?
        public let targetName: String?
        public let testKind: String?
        public let tests: [ActionTestSummaryIdentifiableObject]
        public let diagnosticsDirectoryName: String?
        public let failureSummaries: [ActionTestFailureSummary]
        public let testLanguage: String?
        public let testRegion: String?

        private enum CodingKeys: CodingKey {
            case projectRelativePath
            case targetName
            case testKind
            case tests
            case diagnosticsDirectoryName
            case failureSummaries
            case testLanguage
            case testRegion
        }

        public init(
            name: String?,
            projectRelativePath: String?,
            targetName: String?,
            testKind: String?,
            tests: [ActionTestSummaryIdentifiableObject],
            diagnosticsDirectoryName: String?,
            failureSummaries: [ActionTestFailureSummary],
            testLanguage: String?,
            testRegion: String?
            ) {
            self.projectRelativePath = projectRelativePath
            self.targetName = targetName
            self.testKind = testKind
            self.tests = tests
            self.diagnosticsDirectoryName = diagnosticsDirectoryName
            self.failureSummaries = failureSummaries
            self.testLanguage = testLanguage
            self.testRegion = testRegion
            super.init(name: name)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            projectRelativePath = try container.decodeIfPresent(String.self, forKey: .projectRelativePath)
            targetName = try container.decodeIfPresent(String.self, forKey: .targetName)
            testKind = try container.decodeIfPresent(String.self, forKey: .testKind)
            tests = try container.decode([ActionTestSummaryIdentifiableObject].self, forKey: .tests)
            diagnosticsDirectoryName = try container.decodeIfPresent(String.self, forKey: .diagnosticsDirectoryName)
            failureSummaries = try container.decode([ActionTestFailureSummary].self, forKey: .failureSummaries)
            testLanguage = try container.decodeIfPresent(String.self, forKey: .testLanguage)
            testRegion = try container.decodeIfPresent(String.self, forKey: .testRegion)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(projectRelativePath, forKey: .projectRelativePath)
            try container.encodeIfPresent(targetName, forKey: .targetName)
            try container.encodeIfPresent(testKind, forKey: .testKind)
            try container.encode(tests, forKey: .tests)
            try container.encodeIfPresent(diagnosticsDirectoryName, forKey: .diagnosticsDirectoryName)
            try container.encode(failureSummaries, forKey: .failureSummaries)
            try container.encodeIfPresent(testLanguage, forKey: .testLanguage)
            try container.encodeIfPresent(testRegion, forKey: .testRegion)
        }
    }
}
