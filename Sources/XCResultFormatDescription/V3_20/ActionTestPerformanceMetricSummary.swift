
import Foundation

public extension V3_20 {

    class ActionTestPerformanceMetricSummary: Codable {
        public let displayName: String
        public let unitOfMeasurement: String
        public let measurements: [Double]
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
            displayName: String,
            unitOfMeasurement: String,
            measurements: [Double],
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
            displayName = try container.decode(String.self, forKey: .displayName)
            unitOfMeasurement = try container.decode(String.self, forKey: .unitOfMeasurement)
            measurements = try container.decode([Double].self, forKey: .measurements)
            identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
            baselineName = try container.decodeIfPresent(String.self, forKey: .baselineName)
            baselineAverage = try container.decodeIfPresent(Double.self, forKey: .baselineAverage)
            maxPercentRegression = try container.decodeIfPresent(Double.self, forKey: .maxPercentRegression)
            maxPercentRelativeStandardDeviation = try container.decodeIfPresent(Double.self, forKey: .maxPercentRelativeStandardDeviation)
            maxRegression = try container.decodeIfPresent(Double.self, forKey: .maxRegression)
            maxStandardDeviation = try container.decodeIfPresent(Double.self, forKey: .maxStandardDeviation)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(displayName, forKey: .displayName)
            try container.encode(unitOfMeasurement, forKey: .unitOfMeasurement)
            try container.encode(measurements, forKey: .measurements)
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
