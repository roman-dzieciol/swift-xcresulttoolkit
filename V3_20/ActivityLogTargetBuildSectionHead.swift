
import Foundation

public extension V3_20 {

    class ActivityLogTargetBuildSectionHead: ActivityLogMajorSectionHead {
        public let productType: String?

        private enum CodingKeys: CodingKey {
            case productType
        }

        public init(
            domainType: String,
            title: String,
            startTime: Date?,
            subtitle: String,
            productType: String?
            ) {
            self.productType = productType
            super.init(domainType: domainType, title: title, startTime: startTime, subtitle: subtitle)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            productType = try container.decodeIfPresent(String.self, forKey: .productType)
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(productType, forKey: .productType)
        }
    }
}
