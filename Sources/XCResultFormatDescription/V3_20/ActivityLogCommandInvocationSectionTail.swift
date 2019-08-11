
import Foundation

public extension V3_20 {

    class ActivityLogCommandInvocationSectionTail: ActivityLogSectionTail {
        public let exitCode: Int?

        private enum CodingKeys: CodingKey {
            case exitCode
        }

        public init(
            duration: Double?,
            result: String?,
            exitCode: Int?
            ) {
            self.exitCode = exitCode
            super.init(duration: duration, result: result)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            exitCode = try container.decodeIfPresent(_Value<Int>.self, forKey: .exitCode)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(exitCode, forKey: .exitCode)
        }
    }
}
