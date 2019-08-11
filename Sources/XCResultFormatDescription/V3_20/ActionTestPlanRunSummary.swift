
import Foundation

public extension V3_20 {

    class ActionTestPlanRunSummary: ActionAbstractTestSummary {
        public let testableSummaries: [ActionTestableSummary]?

        private enum CodingKeys: CodingKey {
            case testableSummaries
        }

        public init(
            name: String?,
            testableSummaries: [ActionTestableSummary]?
            ) {
            self.testableSummaries = testableSummaries
            super.init(name: name)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            testableSummaries = try container.decodeIfPresent(_Values<ActionTestableSummary>.self, forKey: .testableSummaries)?._values
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(testableSummaries, forKey: .testableSummaries)
        }
    }
}
