
import Foundation

public extension V3_20 {

    class IssueSummary: Codable {
        public let issueType: String?
        public let message: String?
        public let producingTarget: String?
        public let documentLocationInCreatingWorkspace: DocumentLocation?

        private enum CodingKeys: CodingKey {
            case issueType
            case message
            case producingTarget
            case documentLocationInCreatingWorkspace
        }

        public init(
            issueType: String?,
            message: String?,
            producingTarget: String?,
            documentLocationInCreatingWorkspace: DocumentLocation?
            ) {
            self.issueType = issueType
            self.message = message
            self.producingTarget = producingTarget
            self.documentLocationInCreatingWorkspace = documentLocationInCreatingWorkspace
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            issueType = try container.decodeIfPresent(_Value<String>.self, forKey: .issueType)?._value
            message = try container.decodeIfPresent(_Value<String>.self, forKey: .message)?._value
            producingTarget = try container.decodeIfPresent(_Value<String>.self, forKey: .producingTarget)?._value
            documentLocationInCreatingWorkspace = try container.decodeIfPresent(DocumentLocation.self, forKey: .documentLocationInCreatingWorkspace)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(issueType, forKey: .issueType)
            try container.encodeIfPresent(message, forKey: .message)
            try container.encodeIfPresent(producingTarget, forKey: .producingTarget)
            try container.encodeIfPresent(documentLocationInCreatingWorkspace, forKey: .documentLocationInCreatingWorkspace)
        }
    }
}
