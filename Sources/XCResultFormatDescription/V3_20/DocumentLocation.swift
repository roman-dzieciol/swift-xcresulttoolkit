
import Foundation

public extension V3_20 {

    class DocumentLocation: Codable {
        public let url: String?
        public let concreteTypeName: String?

        private enum CodingKeys: CodingKey {
            case url
            case concreteTypeName
        }

        public init(
            url: String?,
            concreteTypeName: String?
            ) {
            self.url = url
            self.concreteTypeName = concreteTypeName
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            url = try container.decodeIfPresent(_Value<String>.self, forKey: .url)?._value
            concreteTypeName = try container.decodeIfPresent(_Value<String>.self, forKey: .concreteTypeName)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(url, forKey: .url)
            try container.encodeIfPresent(concreteTypeName, forKey: .concreteTypeName)
        }
    }
}
