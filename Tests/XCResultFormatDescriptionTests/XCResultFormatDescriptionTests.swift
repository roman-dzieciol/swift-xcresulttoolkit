
import XCTest
import XCResultToolKit
import XCResultFormatDescription
import SwiftSyntax
import SWLintKit

final class XCResultFormatDescriptionTests: XCTestCase {


    func testExample() throws {
        
        do {
            
            let toolkit = XCResultToolKit()
            let xcresultURL = URL(fileURLWithPath: "\(#file)")
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .appendingPathComponent("Resources")
                .appendingPathComponent("3_20.xcresult")
            let jsonData = try toolkit.get(path: xcresultURL.path)
            let decoder = JSONDecoder()
            let actionInvocationRecord = try decoder.decode(V3_20.ActionsInvocationRecord.self, from: jsonData)
            print(actionInvocationRecord)
        } catch {
            print(error)
        }
    }
}

public struct _SuperType: Codable {
    public let _name: String
}

public struct _Type: Codable {
    public let _name: String
    public let _supertype: _SuperType?
}
