
import Foundation

public extension V3_20 {

    class StreamedActionInfo: Codable {
        public let actionIndex: Int

        private enum CodingKeys: CodingKey {
            case actionIndex
        }

        public init(
            actionIndex: Int
            ) {
            self.actionIndex = actionIndex
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            actionIndex = try container.decode(Int.self, forKey: .actionIndex)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(actionIndex, forKey: .actionIndex)
        }
    }
}
