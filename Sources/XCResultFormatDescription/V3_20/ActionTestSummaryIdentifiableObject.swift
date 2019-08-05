
import Foundation

public extension V3_20 {

    class ActionTestSummaryIdentifiableObject: ActionAbstractTestSummary {
        public let identifier: String?

        private enum CodingKeys: CodingKey {
            case identifier
        }

        public init(
            name: String?,
            identifier: String?
            ) {
            self.identifier = identifier
            super.init(name: name)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(identifier, forKey: .identifier)
        }
    }
}
