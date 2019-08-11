
import Foundation

public extension V3_20 {

    class ActionTestableSummary: ActionAbstractTestSummary {
        public let projectRelativePath: String?
        public let targetName: String?
        public let testKind: String?
        public let tests: [ActionTestSummaryIdentifiableObject]?
        public let diagnosticsDirectoryName: String?
        public let failureSummaries: [ActionTestFailureSummary]?
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
            tests: [ActionTestSummaryIdentifiableObject]?,
            diagnosticsDirectoryName: String?,
            failureSummaries: [ActionTestFailureSummary]?,
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
            projectRelativePath = try container.decodeIfPresent(_Value<String>.self, forKey: .projectRelativePath)?._value
            targetName = try container.decodeIfPresent(_Value<String>.self, forKey: .targetName)?._value
            testKind = try container.decodeIfPresent(_Value<String>.self, forKey: .testKind)?._value
            tests = try container.decodeIfPresent(_Values<ActionTestSummaryIdentifiableObject>.self, forKey: .tests)?._values
            diagnosticsDirectoryName = try container.decodeIfPresent(_Value<String>.self, forKey: .diagnosticsDirectoryName)?._value
            failureSummaries = try container.decodeIfPresent(_Values<ActionTestFailureSummary>.self, forKey: .failureSummaries)?._values
            testLanguage = try container.decodeIfPresent(_Value<String>.self, forKey: .testLanguage)?._value
            testRegion = try container.decodeIfPresent(_Value<String>.self, forKey: .testRegion)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(projectRelativePath, forKey: .projectRelativePath)
            try container.encodeIfPresent(targetName, forKey: .targetName)
            try container.encodeIfPresent(testKind, forKey: .testKind)
            try container.encodeIfPresent(tests, forKey: .tests)
            try container.encodeIfPresent(diagnosticsDirectoryName, forKey: .diagnosticsDirectoryName)
            try container.encodeIfPresent(failureSummaries, forKey: .failureSummaries)
            try container.encodeIfPresent(testLanguage, forKey: .testLanguage)
            try container.encodeIfPresent(testRegion, forKey: .testRegion)
        }
    }
}
