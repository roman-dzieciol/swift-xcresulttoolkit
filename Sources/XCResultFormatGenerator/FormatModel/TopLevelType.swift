
import Foundation

public class TopLevelType {

    public let name: String
    public let supertype: TopLevelType?
    public let properties: [Property]

    public lazy var allProperties: [Property] = { allSuperProperties + properties }()

    public lazy var allSuperProperties: [Property] = { supertype?.allProperties ?? [] }()

    public init(
        name: String,
        supertype: TopLevelType?,
        properties: [Property]
        ) {
        self.name = name
        self.supertype = supertype
        self.properties = properties
    }
}
