
import Foundation

public extension V3_20 {

    class ActionAbstractTestSummary: Codable {
        public let name: String?

        private enum CodingKeys: CodingKey {
            case name
        }

        public init(
            name: String?
            ) {
            self.name = name
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decodeIfPresent(_Value<String>.self, forKey: .name)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(name, forKey: .name)
        }
    }
}
