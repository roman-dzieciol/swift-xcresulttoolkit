
import Foundation

public extension V3_20 {

    class ActivityLogMajorSectionTail: ActivityLogSectionTail {

        private enum CodingKeys: CodingKey {
        }

        public override init(
            duration: Double?,
            result: String?
            ) {
            super.init(duration: duration, result: result)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
        }
    }
}
