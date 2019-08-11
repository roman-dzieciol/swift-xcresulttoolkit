
import Foundation

public extension V3_20 {

    class ActivityLogCommandInvocationSection: ActivityLogSection {
        public let commandDetails: String?
        public let emittedOutput: String?
        public let exitCode: Int?

        private enum CodingKeys: CodingKey {
            case commandDetails
            case emittedOutput
            case exitCode
        }

        public init(
            domainType: String?,
            title: String?,
            startTime: Date?,
            duration: Double?,
            result: String?,
            subsections: [ActivityLogSection]?,
            messages: [ActivityLogMessage]?,
            commandDetails: String?,
            emittedOutput: String?,
            exitCode: Int?
            ) {
            self.commandDetails = commandDetails
            self.emittedOutput = emittedOutput
            self.exitCode = exitCode
            super.init(domainType: domainType, title: title, startTime: startTime, duration: duration, result: result, subsections: subsections, messages: messages)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            commandDetails = try container.decodeIfPresent(_Value<String>.self, forKey: .commandDetails)?._value
            emittedOutput = try container.decodeIfPresent(_Value<String>.self, forKey: .emittedOutput)?._value
            exitCode = try container.decodeIfPresent(_Value<Int>.self, forKey: .exitCode)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(commandDetails, forKey: .commandDetails)
            try container.encodeIfPresent(emittedOutput, forKey: .emittedOutput)
            try container.encodeIfPresent(exitCode, forKey: .exitCode)
        }
    }
}
