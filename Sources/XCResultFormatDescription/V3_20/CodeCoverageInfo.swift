
import Foundation

public extension V3_20 {

    class CodeCoverageInfo: Codable {
        public let hasCoverageData: Bool?
        public let reportRef: Reference?
        public let archiveRef: Reference?

        private enum CodingKeys: CodingKey {
            case hasCoverageData
            case reportRef
            case archiveRef
        }

        public init(
            hasCoverageData: Bool?,
            reportRef: Reference?,
            archiveRef: Reference?
            ) {
            self.hasCoverageData = hasCoverageData
            self.reportRef = reportRef
            self.archiveRef = archiveRef
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            hasCoverageData = try container.decodeIfPresent(_Value<Bool>.self, forKey: .hasCoverageData)?._value
            reportRef = try container.decodeIfPresent(Reference.self, forKey: .reportRef)
            archiveRef = try container.decodeIfPresent(Reference.self, forKey: .archiveRef)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(hasCoverageData, forKey: .hasCoverageData)
            try container.encodeIfPresent(reportRef, forKey: .reportRef)
            try container.encodeIfPresent(archiveRef, forKey: .archiveRef)
        }
    }
}
