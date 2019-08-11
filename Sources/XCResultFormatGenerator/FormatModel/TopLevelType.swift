
import Foundation

public class TopLevelType {

    public let name: String
    public let supertype: TopLevelType?
    public let isValue: Bool
    public let isArray: Bool
    public let properties: [Property]

    public lazy var allProperties: [Property] = { allSuperProperties + properties }()

    public lazy var allSuperProperties: [Property] = { supertype?.allProperties ?? [] }()

    public init(
        name: String,
        supertype: TopLevelType?,
        isValue: Bool,
        isArray: Bool,
        properties: [Property]
        ) {
        self.name = name
        self.supertype = supertype
        self.isValue = isValue
        self.isArray = isArray
        self.properties = properties
    }
}
