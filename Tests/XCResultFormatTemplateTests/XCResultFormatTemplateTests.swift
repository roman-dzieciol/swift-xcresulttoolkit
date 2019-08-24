
import XCTest
import XCResultToolKit
import XCResultFormatDescription

final class XCResultFormatDescriptionTests: XCTestCase {

    func testItLoadsActionsInvocationRecord() throws {
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
            XCTFail("\(error)")
        }
    }
}
