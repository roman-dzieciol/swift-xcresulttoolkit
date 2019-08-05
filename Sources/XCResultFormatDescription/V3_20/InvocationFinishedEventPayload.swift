
import Foundation

public extension V3_20 {

    class InvocationFinishedEventPayload: AnyStreamedEventPayload {
        public let recordRef: Reference?

        private enum CodingKeys: CodingKey {
            case recordRef
        }

        public init(
            recordRef: Reference?
            ) {
            self.recordRef = recordRef
            super.init()
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            recordRef = try container.decodeIfPresent(Reference.self, forKey: .recordRef)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(recordRef, forKey: .recordRef)
        }
    }
}
