
import Foundation

public extension V3_20 {

    class ActionTestFailureSummary: Codable {
        public let message: String?
        public let fileName: String
        public let lineNumber: Int
        public let isPerformanceFailure: Bool

        private enum CodingKeys: CodingKey {
            case message
            case fileName
            case lineNumber
            case isPerformanceFailure
        }

        public init(
            message: String?,
            fileName: String,
            lineNumber: Int,
            isPerformanceFailure: Bool
            ) {
            self.message = message
            self.fileName = fileName
            self.lineNumber = lineNumber
            self.isPerformanceFailure = isPerformanceFailure
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            message = try container.decodeIfPresent(String.self, forKey: .message)
            fileName = try container.decode(_Value<String>.self, forKey: .fileName)._value
            lineNumber = try container.decode(_Value<Int>.self, forKey: .lineNumber)._value
            isPerformanceFailure = try container.decode(_Value<Bool>.self, forKey: .isPerformanceFailure)._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(message, forKey: .message)
            try container.encode(fileName, forKey: .fileName)
            try container.encode(lineNumber, forKey: .lineNumber)
            try container.encode(isPerformanceFailure, forKey: .isPerformanceFailure)
        }
    }
}
