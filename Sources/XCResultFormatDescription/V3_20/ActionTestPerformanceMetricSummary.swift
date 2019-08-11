
import Foundation

public extension V3_20 {

    class ActionTestPerformanceMetricSummary: Codable {
        public let displayName: String?
        public let unitOfMeasurement: String?
        public let measurements: [Double]?
        public let identifier: String?
        public let baselineName: String?
        public let baselineAverage: Double?
        public let maxPercentRegression: Double?
        public let maxPercentRelativeStandardDeviation: Double?
        public let maxRegression: Double?
        public let maxStandardDeviation: Double?

        private enum CodingKeys: CodingKey {
            case displayName
            case unitOfMeasurement
            case measurements
            case identifier
            case baselineName
            case baselineAverage
            case maxPercentRegression
            case maxPercentRelativeStandardDeviation
            case maxRegression
            case maxStandardDeviation
        }

        public init(
            displayName: String?,
            unitOfMeasurement: String?,
            measurements: [Double]?,
            identifier: String?,
            baselineName: String?,
            baselineAverage: Double?,
            maxPercentRegression: Double?,
            maxPercentRelativeStandardDeviation: Double?,
            maxRegression: Double?,
            maxStandardDeviation: Double?
            ) {
            self.displayName = displayName
            self.unitOfMeasurement = unitOfMeasurement
            self.measurements = measurements
            self.identifier = identifier
            self.baselineName = baselineName
            self.baselineAverage = baselineAverage
            self.maxPercentRegression = maxPercentRegression
            self.maxPercentRelativeStandardDeviation = maxPercentRelativeStandardDeviation
            self.maxRegression = maxRegression
            self.maxStandardDeviation = maxStandardDeviation
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            displayName = try container.decodeIfPresent(_Value<String>.self, forKey: .displayName)?._value
            unitOfMeasurement = try container.decodeIfPresent(_Value<String>.self, forKey: .unitOfMeasurement)?._value
            measurements = try container.decodeIfPresent(_Values<Double>.self, forKey: .measurements)?._values
            identifier = try container.decodeIfPresent(_Value<String>.self, forKey: .identifier)?._value
            baselineName = try container.decodeIfPresent(_Value<String>.self, forKey: .baselineName)?._value
            baselineAverage = try container.decodeIfPresent(_Value<Double>.self, forKey: .baselineAverage)?._value
            maxPercentRegression = try container.decodeIfPresent(_Value<Double>.self, forKey: .maxPercentRegression)?._value
            maxPercentRelativeStandardDeviation = try container.decodeIfPresent(_Value<Double>.self, forKey: .maxPercentRelativeStandardDeviation)?._value
            maxRegression = try container.decodeIfPresent(_Value<Double>.self, forKey: .maxRegression)?._value
            maxStandardDeviation = try container.decodeIfPresent(_Value<Double>.self, forKey: .maxStandardDeviation)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(displayName, forKey: .displayName)
            try container.encodeIfPresent(unitOfMeasurement, forKey: .unitOfMeasurement)
            try container.encodeIfPresent(measurements, forKey: .measurements)
            try container.encodeIfPresent(identifier, forKey: .identifier)
            try container.encodeIfPresent(baselineName, forKey: .baselineName)
            try container.encodeIfPresent(baselineAverage, forKey: .baselineAverage)
            try container.encodeIfPresent(maxPercentRegression, forKey: .maxPercentRegression)
            try container.encodeIfPresent(maxPercentRelativeStandardDeviation, forKey: .maxPercentRelativeStandardDeviation)
            try container.encodeIfPresent(maxRegression, forKey: .maxRegression)
            try container.encodeIfPresent(maxStandardDeviation, forKey: .maxStandardDeviation)
        }
    }
}
