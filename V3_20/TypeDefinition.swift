
import Foundation

public extension V3_20 {

    class TypeDefinition: Codable {
        public let name: String
        public let supertype: TypeDefinition?

        private enum CodingKeys: CodingKey {
            case name
            case supertype
        }

        public init(
            name: String,
            supertype: TypeDefinition?
            ) {
            self.name = name
            self.supertype = supertype
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            supertype = try container.decodeIfPresent(TypeDefinition.self, forKey: .supertype)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encodeIfPresent(supertype, forKey: .supertype)
        }
    }
}
