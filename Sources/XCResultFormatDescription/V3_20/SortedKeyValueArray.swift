
import Foundation

public extension V3_20 {

    class SortedKeyValueArray: Codable {
        public let storage: [SortedKeyValueArrayPair]

        private enum CodingKeys: CodingKey {
            case storage
        }

        public init(
            storage: [SortedKeyValueArrayPair]
            ) {
            self.storage = storage
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            storage = try container.decode([SortedKeyValueArrayPair].self, forKey: .storage)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(storage, forKey: .storage)
        }
    }
}
