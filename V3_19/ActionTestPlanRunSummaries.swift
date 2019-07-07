
import Foundation

public extension V3_19 {

    class ActionTestPlanRunSummaries: Codable {
        public let summaries: [ActionTestPlanRunSummary]

        private enum CodingKeys: CodingKey {
            case summaries
        }

        public init(
            summaries: [ActionTestPlanRunSummary]
            ) {
            self.summaries = summaries
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            summaries = try container.decode([ActionTestPlanRunSummary].self, forKey: .summaries)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(summaries, forKey: .summaries)
        }
    }
}
