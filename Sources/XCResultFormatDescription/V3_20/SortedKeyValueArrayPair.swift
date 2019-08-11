
import Foundation

public extension V3_20 {

    class SortedKeyValueArrayPair: Codable {
        public let key: String?
        public let value: SchemaSerializable?

        private enum CodingKeys: CodingKey {
            case key
            case value
        }

        public init(
            key: String?,
            value: SchemaSerializable?
            ) {
            self.key = key
            self.value = value
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            key = try container.decodeIfPresent(_Value<String>.self, forKey: .key)?._value
            value = try container.decodeIfPresent(SchemaSerializable.self, forKey: .value)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(key, forKey: .key)
            try container.encodeIfPresent(value, forKey: .value)
        }
    }
}
