
import Foundation

public extension V3_20 {

    class ArchiveInfo: Codable {
        public let path: String?

        private enum CodingKeys: CodingKey {
            case path
        }

        public init(
            path: String?
            ) {
            self.path = path
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            path = try container.decodeIfPresent(_Value<String>.self, forKey: .path)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(path, forKey: .path)
        }
    }
}
