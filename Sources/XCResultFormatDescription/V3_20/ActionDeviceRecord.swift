
import Foundation

public extension V3_20 {

    class ActionDeviceRecord: Codable {
        public let name: String
        public let isConcreteDevice: Bool
        public let operatingSystemVersion: String
        public let operatingSystemVersionWithBuildNumber: String
        public let nativeArchitecture: String
        public let modelName: String
        public let modelCode: String
        public let modelUTI: String
        public let identifier: String
        public let isWireless: Bool
        public let cpuKind: String
        public let cpuCount: Int?
        public let cpuSpeedInMHz: Int?
        public let busSpeedInMHz: Int?
        public let ramSizeInMegabytes: Int?
        public let physicalCPUCoresPerPackage: Int?
        public let logicalCPUCoresPerPackage: Int?
        public let platformRecord: ActionPlatformRecord

        private enum CodingKeys: CodingKey {
            case name
            case isConcreteDevice
            case operatingSystemVersion
            case operatingSystemVersionWithBuildNumber
            case nativeArchitecture
            case modelName
            case modelCode
            case modelUTI
            case identifier
            case isWireless
            case cpuKind
            case cpuCount
            case cpuSpeedInMHz
            case busSpeedInMHz
            case ramSizeInMegabytes
            case physicalCPUCoresPerPackage
            case logicalCPUCoresPerPackage
            case platformRecord
        }

        public init(
            name: String,
            isConcreteDevice: Bool,
            operatingSystemVersion: String,
            operatingSystemVersionWithBuildNumber: String,
            nativeArchitecture: String,
            modelName: String,
            modelCode: String,
            modelUTI: String,
            identifier: String,
            isWireless: Bool,
            cpuKind: String,
            cpuCount: Int?,
            cpuSpeedInMHz: Int?,
            busSpeedInMHz: Int?,
            ramSizeInMegabytes: Int?,
            physicalCPUCoresPerPackage: Int?,
            logicalCPUCoresPerPackage: Int?,
            platformRecord: ActionPlatformRecord
            ) {
            self.name = name
            self.isConcreteDevice = isConcreteDevice
            self.operatingSystemVersion = operatingSystemVersion
            self.operatingSystemVersionWithBuildNumber = operatingSystemVersionWithBuildNumber
            self.nativeArchitecture = nativeArchitecture
            self.modelName = modelName
            self.modelCode = modelCode
            self.modelUTI = modelUTI
            self.identifier = identifier
            self.isWireless = isWireless
            self.cpuKind = cpuKind
            self.cpuCount = cpuCount
            self.cpuSpeedInMHz = cpuSpeedInMHz
            self.busSpeedInMHz = busSpeedInMHz
            self.ramSizeInMegabytes = ramSizeInMegabytes
            self.physicalCPUCoresPerPackage = physicalCPUCoresPerPackage
            self.logicalCPUCoresPerPackage = logicalCPUCoresPerPackage
            self.platformRecord = platformRecord
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(_Value<String>.self, forKey: .name)._value
            isConcreteDevice = try container.decode(_Value<Bool>.self, forKey: .isConcreteDevice)._value
            operatingSystemVersion = try container.decode(_Value<String>.self, forKey: .operatingSystemVersion)._value
            operatingSystemVersionWithBuildNumber = try container.decode(_Value<String>.self, forKey: .operatingSystemVersionWithBuildNumber)._value
            nativeArchitecture = try container.decode(_Value<String>.self, forKey: .nativeArchitecture)._value
            modelName = try container.decode(_Value<String>.self, forKey: .modelName)._value
            modelCode = try container.decode(_Value<String>.self, forKey: .modelCode)._value
            modelUTI = try container.decode(_Value<String>.self, forKey: .modelUTI)._value
            identifier = try container.decode(_Value<String>.self, forKey: .identifier)._value
            isWireless = try container.decode(_Value<Bool>.self, forKey: .isWireless)._value
            cpuKind = try container.decode(_Value<String>.self, forKey: .cpuKind)._value
            cpuCount = try container.decodeIfPresent(Int.self, forKey: .cpuCount)
            cpuSpeedInMHz = try container.decodeIfPresent(Int.self, forKey: .cpuSpeedInMHz)
            busSpeedInMHz = try container.decodeIfPresent(Int.self, forKey: .busSpeedInMHz)
            ramSizeInMegabytes = try container.decodeIfPresent(Int.self, forKey: .ramSizeInMegabytes)
            physicalCPUCoresPerPackage = try container.decodeIfPresent(Int.self, forKey: .physicalCPUCoresPerPackage)
            logicalCPUCoresPerPackage = try container.decodeIfPresent(Int.self, forKey: .logicalCPUCoresPerPackage)
            platformRecord = try container.decode(ActionPlatformRecord.self, forKey: .platformRecord)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(isConcreteDevice, forKey: .isConcreteDevice)
            try container.encode(operatingSystemVersion, forKey: .operatingSystemVersion)
            try container.encode(operatingSystemVersionWithBuildNumber, forKey: .operatingSystemVersionWithBuildNumber)
            try container.encode(nativeArchitecture, forKey: .nativeArchitecture)
            try container.encode(modelName, forKey: .modelName)
            try container.encode(modelCode, forKey: .modelCode)
            try container.encode(modelUTI, forKey: .modelUTI)
            try container.encode(identifier, forKey: .identifier)
            try container.encode(isWireless, forKey: .isWireless)
            try container.encode(cpuKind, forKey: .cpuKind)
            try container.encodeIfPresent(cpuCount, forKey: .cpuCount)
            try container.encodeIfPresent(cpuSpeedInMHz, forKey: .cpuSpeedInMHz)
            try container.encodeIfPresent(busSpeedInMHz, forKey: .busSpeedInMHz)
            try container.encodeIfPresent(ramSizeInMegabytes, forKey: .ramSizeInMegabytes)
            try container.encodeIfPresent(physicalCPUCoresPerPackage, forKey: .physicalCPUCoresPerPackage)
            try container.encodeIfPresent(logicalCPUCoresPerPackage, forKey: .logicalCPUCoresPerPackage)
            try container.encode(platformRecord, forKey: .platformRecord)
        }
    }
}
