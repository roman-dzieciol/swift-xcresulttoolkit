
import Foundation

public class SchemaSerializable: Codable {

    private enum CodingKeys: CodingKey {
    }

    public init(
        ) {
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    }

    public  func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
