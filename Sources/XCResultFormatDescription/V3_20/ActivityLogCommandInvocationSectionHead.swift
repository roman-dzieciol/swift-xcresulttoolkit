
import Foundation

public extension V3_20 {

    class ActivityLogCommandInvocationSectionHead: ActivityLogSectionHead {
        public let commandDetails: String?

        private enum CodingKeys: CodingKey {
            case commandDetails
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            commandDetails: String?
            ) {
            self.commandDetails = commandDetails
            super.init(domainType: domainType, title: title, startTime: startTime)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            commandDetails = try container.decodeIfPresent(_Value<String>.self, forKey: .commandDetails)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(commandDetails, forKey: .commandDetails)
        }
    }
}
