
import Foundation

public extension V3_20 {

    class TestFailureIssueSummary: IssueSummary {
        public let testCaseName: String?

        private enum CodingKeys: CodingKey {
            case testCaseName
        }

        public init(
            issueType: String?,
            message: String?,
            producingTarget: String?,
            documentLocationInCreatingWorkspace: DocumentLocation?,
            testCaseName: String?
            ) {
            self.testCaseName = testCaseName
            super.init(issueType: issueType, message: message, producingTarget: producingTarget, documentLocationInCreatingWorkspace: documentLocationInCreatingWorkspace)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testCaseName = try container.decodeIfPresent(_Value<String>.self, forKey: .testCaseName)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testCaseName, forKey: .testCaseName)
        }
    }
}
