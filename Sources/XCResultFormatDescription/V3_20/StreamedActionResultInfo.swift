
import Foundation

public extension V3_20 {

    class StreamedActionResultInfo: Codable {
        public let actionIndex: Int
        public let resultIndex: Int

        private enum CodingKeys: CodingKey {
            case actionIndex
            case resultIndex
        }

        public init(
            actionIndex: Int,
            resultIndex: Int
            ) {
            self.actionIndex = actionIndex
            self.resultIndex = resultIndex
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            actionIndex = try container.decode(Int.self, forKey: .actionIndex)
            resultIndex = try container.decode(Int.self, forKey: .resultIndex)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(actionIndex, forKey: .actionIndex)
            try container.encode(resultIndex, forKey: .resultIndex)
        }
    }
}
