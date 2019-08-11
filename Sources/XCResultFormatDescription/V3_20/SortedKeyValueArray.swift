
import Foundation

public extension V3_20 {

    class SortedKeyValueArray: Codable {
        public let storage: [SortedKeyValueArrayPair]?

        private enum CodingKeys: CodingKey {
            case storage
        }

        public init(
            storage: [SortedKeyValueArrayPair]?
            ) {
            self.storage = storage
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            storage = try container.decodeIfPresent(_Values<SortedKeyValueArrayPair>.self, forKey: .storage)?._values
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(storage, forKey: .storage)
        }
    }
}
