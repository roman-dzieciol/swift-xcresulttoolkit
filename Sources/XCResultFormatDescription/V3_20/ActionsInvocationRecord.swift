
import Foundation

public extension V3_20 {

    class ActionsInvocationRecord: Codable {
        public let metadataRef: Reference?
        public let metrics: ResultMetrics
        public let issues: ResultIssueSummaries
        public let actions: [ActionRecord]
        public let archive: ArchiveInfo?

        private enum CodingKeys: CodingKey {
            case metadataRef
            case metrics
            case issues
            case actions
            case archive
        }

        public init(
            metadataRef: Reference?,
            metrics: ResultMetrics,
            issues: ResultIssueSummaries,
            actions: [ActionRecord],
            archive: ArchiveInfo?
            ) {
            self.metadataRef = metadataRef
            self.metrics = metrics
            self.issues = issues
            self.actions = actions
            self.archive = archive
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            metadataRef = try container.decodeIfPresent(Reference.self, forKey: .metadataRef)
            metrics = try container.decode(ResultMetrics.self, forKey: .metrics)
            issues = try container.decode(ResultIssueSummaries.self, forKey: .issues)
            actions = try container.decode([ActionRecord].self, forKey: .actions)
            archive = try container.decodeIfPresent(ArchiveInfo.self, forKey: .archive)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(metadataRef, forKey: .metadataRef)
            try container.encode(metrics, forKey: .metrics)
            try container.encode(issues, forKey: .issues)
            try container.encode(actions, forKey: .actions)
            try container.encodeIfPresent(archive, forKey: .archive)
        }
    }
}
