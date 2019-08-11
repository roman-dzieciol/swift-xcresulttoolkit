
import Foundation

public extension V3_20 {

    class ActionDeviceRecord: Codable {
        public let name: String?
        public let isConcreteDevice: Bool?
        public let operatingSystemVersion: String?
        public let operatingSystemVersionWithBuildNumber: String?
        public let nativeArchitecture: String?
        public let modelName: String?
        public let modelCode: String?
        public let modelUTI: String?
        public let identifier: String?
        public let isWireless: Bool?
        public let cpuKind: String?
        public let cpuCount: Int?
        public let cpuSpeedInMHz: Int?
        public let busSpeedInMHz: Int?
        public let ramSizeInMegabytes: Int?
        public let physicalCPUCoresPerPackage: Int?
        public let logicalCPUCoresPerPackage: Int?
        public let platformRecord: ActionPlatformRecord?

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
            name: String?,
            isConcreteDevice: Bool?,
            operatingSystemVersion: String?,
            operatingSystemVersionWithBuildNumber: String?,
            nativeArchitecture: String?,
            modelName: String?,
            modelCode: String?,
            modelUTI: String?,
            identifier: String?,
            isWireless: Bool?,
            cpuKind: String?,
            cpuCount: Int?,
            cpuSpeedInMHz: Int?,
            busSpeedInMHz: Int?,
            ramSizeInMegabytes: Int?,
            physicalCPUCoresPerPackage: Int?,
            logicalCPUCoresPerPackage: Int?,
            platformRecord: ActionPlatformRecord?
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
            name = try container.decodeIfPresent(_Value<String>.self, forKey: .name)?._value
            isConcreteDevice = try container.decodeIfPresent(_Value<Bool>.self, forKey: .isConcreteDevice)?._value
            operatingSystemVersion = try container.decodeIfPresent(_Value<String>.self, forKey: .operatingSystemVersion)?._value
            operatingSystemVersionWithBuildNumber = try container.decodeIfPresent(_Value<String>.self, forKey: .operatingSystemVersionWithBuildNumber)?._value
            nativeArchitecture = try container.decodeIfPresent(_Value<String>.self, forKey: .nativeArchitecture)?._value
            modelName = try container.decodeIfPresent(_Value<String>.self, forKey: .modelName)?._value
            modelCode = try container.decodeIfPresent(_Value<String>.self, forKey: .modelCode)?._value
            modelUTI = try container.decodeIfPresent(_Value<String>.self, forKey: .modelUTI)?._value
            identifier = try container.decodeIfPresent(_Value<String>.self, forKey: .identifier)?._value
            isWireless = try container.decodeIfPresent(_Value<Bool>.self, forKey: .isWireless)?._value
            cpuKind = try container.decodeIfPresent(_Value<String>.self, forKey: .cpuKind)?._value
            cpuCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .cpuCount)?._value
            cpuSpeedInMHz = try container.decodeIfPresent(_Value<Int>.self, forKey: .cpuSpeedInMHz)?._value
            busSpeedInMHz = try container.decodeIfPresent(_Value<Int>.self, forKey: .busSpeedInMHz)?._value
            ramSizeInMegabytes = try container.decodeIfPresent(_Value<Int>.self, forKey: .ramSizeInMegabytes)?._value
            physicalCPUCoresPerPackage = try container.decodeIfPresent(_Value<Int>.self, forKey: .physicalCPUCoresPerPackage)?._value
            logicalCPUCoresPerPackage = try container.decodeIfPresent(_Value<Int>.self, forKey: .logicalCPUCoresPerPackage)?._value
            platformRecord = try container.decodeIfPresent(ActionPlatformRecord.self, forKey: .platformRecord)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(isConcreteDevice, forKey: .isConcreteDevice)
            try container.encodeIfPresent(operatingSystemVersion, forKey: .operatingSystemVersion)
            try container.encodeIfPresent(operatingSystemVersionWithBuildNumber, forKey: .operatingSystemVersionWithBuildNumber)
            try container.encodeIfPresent(nativeArchitecture, forKey: .nativeArchitecture)
            try container.encodeIfPresent(modelName, forKey: .modelName)
            try container.encodeIfPresent(modelCode, forKey: .modelCode)
            try container.encodeIfPresent(modelUTI, forKey: .modelUTI)
            try container.encodeIfPresent(identifier, forKey: .identifier)
            try container.encodeIfPresent(isWireless, forKey: .isWireless)
            try container.encodeIfPresent(cpuKind, forKey: .cpuKind)
            try container.encodeIfPresent(cpuCount, forKey: .cpuCount)
            try container.encodeIfPresent(cpuSpeedInMHz, forKey: .cpuSpeedInMHz)
            try container.encodeIfPresent(busSpeedInMHz, forKey: .busSpeedInMHz)
            try container.encodeIfPresent(ramSizeInMegabytes, forKey: .ramSizeInMegabytes)
            try container.encodeIfPresent(physicalCPUCoresPerPackage, forKey: .physicalCPUCoresPerPackage)
            try container.encodeIfPresent(logicalCPUCoresPerPackage, forKey: .logicalCPUCoresPerPackage)
            try container.encodeIfPresent(platformRecord, forKey: .platformRecord)
        }
    }
}
