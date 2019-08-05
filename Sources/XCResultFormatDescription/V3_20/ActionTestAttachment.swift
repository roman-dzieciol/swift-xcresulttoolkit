
import Foundation

public extension V3_20 {

    class ActionTestAttachment: Codable {
        public let uniformTypeIdentifier: String
        public let name: String?
        public let timestamp: Date?
        public let userInfo: SortedKeyValueArray?
        public let lifetime: String
        public let inActivityIdentifier: Int
        public let filename: String?
        public let payloadRef: Reference?
        public let payloadSize: Int

        private enum CodingKeys: CodingKey {
            case uniformTypeIdentifier
            case name
            case timestamp
            case userInfo
            case lifetime
            case inActivityIdentifier
            case filename
            case payloadRef
            case payloadSize
        }

        public init(
            uniformTypeIdentifier: String,
            name: String?,
            timestamp: Date?,
            userInfo: SortedKeyValueArray?,
            lifetime: String,
            inActivityIdentifier: Int,
            filename: String?,
            payloadRef: Reference?,
            payloadSize: Int
            ) {
            self.uniformTypeIdentifier = uniformTypeIdentifier
            self.name = name
            self.timestamp = timestamp
            self.userInfo = userInfo
            self.lifetime = lifetime
            self.inActivityIdentifier = inActivityIdentifier
            self.filename = filename
            self.payloadRef = payloadRef
            self.payloadSize = payloadSize
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            uniformTypeIdentifier = try container.decode(String.self, forKey: .uniformTypeIdentifier)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
            userInfo = try container.decodeIfPresent(SortedKeyValueArray.self, forKey: .userInfo)
            lifetime = try container.decode(String.self, forKey: .lifetime)
            inActivityIdentifier = try container.decode(Int.self, forKey: .inActivityIdentifier)
            filename = try container.decodeIfPresent(String.self, forKey: .filename)
            payloadRef = try container.decodeIfPresent(Reference.self, forKey: .payloadRef)
            payloadSize = try container.decode(Int.self, forKey: .payloadSize)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(uniformTypeIdentifier, forKey: .uniformTypeIdentifier)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(timestamp, forKey: .timestamp)
            try container.encodeIfPresent(userInfo, forKey: .userInfo)
            try container.encode(lifetime, forKey: .lifetime)
            try container.encode(inActivityIdentifier, forKey: .inActivityIdentifier)
            try container.encodeIfPresent(filename, forKey: .filename)
            try container.encodeIfPresent(payloadRef, forKey: .payloadRef)
            try container.encode(payloadSize, forKey: .payloadSize)
        }
    }
}
