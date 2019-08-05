
import Foundation

public extension V3_20 {

    class ActionRunDestinationRecord: Codable {
        public let displayName: String
        public let targetArchitecture: String
        public let targetDeviceRecord: ActionDeviceRecord
        public let localComputerRecord: ActionDeviceRecord
        public let targetSDKRecord: ActionSDKRecord

        private enum CodingKeys: CodingKey {
            case displayName
            case targetArchitecture
            case targetDeviceRecord
            case localComputerRecord
            case targetSDKRecord
        }

        public init(
            displayName: String,
            targetArchitecture: String,
            targetDeviceRecord: ActionDeviceRecord,
            localComputerRecord: ActionDeviceRecord,
            targetSDKRecord: ActionSDKRecord
            ) {
            self.displayName = displayName
            self.targetArchitecture = targetArchitecture
            self.targetDeviceRecord = targetDeviceRecord
            self.localComputerRecord = localComputerRecord
            self.targetSDKRecord = targetSDKRecord
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            displayName = try container.decode(_Value<String>.self, forKey: .displayName)._value
            targetArchitecture = try container.decode(_Value<String>.self, forKey: .targetArchitecture)._value
            targetDeviceRecord = try container.decode(ActionDeviceRecord.self, forKey: .targetDeviceRecord)
            localComputerRecord = try container.decode(ActionDeviceRecord.self, forKey: .localComputerRecord)
            targetSDKRecord = try container.decode(ActionSDKRecord.self, forKey: .targetSDKRecord)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(displayName, forKey: .displayName)
            try container.encode(targetArchitecture, forKey: .targetArchitecture)
            try container.encode(targetDeviceRecord, forKey: .targetDeviceRecord)
            try container.encode(localComputerRecord, forKey: .localComputerRecord)
            try container.encode(targetSDKRecord, forKey: .targetSDKRecord)
        }
    }
}
