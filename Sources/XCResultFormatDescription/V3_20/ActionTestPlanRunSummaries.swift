
import Foundation

public extension V3_20 {

    class ActionTestPlanRunSummaries: Codable {
        public let summaries: [ActionTestPlanRunSummary]?

        private enum CodingKeys: CodingKey {
            case summaries
        }

        public init(
            summaries: [ActionTestPlanRunSummary]?
            ) {
            self.summaries = summaries
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            summaries = try container.decodeIfPresent(_Values<ActionTestPlanRunSummary>.self, forKey: .summaries)?._values
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(summaries, forKey: .summaries)
        }
    }
}
