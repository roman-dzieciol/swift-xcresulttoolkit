

import XCTest
import XCResultToolKit
import XCResultFormatGenerator
import SwiftSyntax
import SWLintKit

final class XCResultFormatGeneratorTests: XCTestCase {

    func testItGenerates() {
        do {
            let baseURL = rootDirURL()
                .deletingLastPathComponent()
                .appendingPathComponent("swift-xcresulttool-format-description")
            let generator = XCResultFormatGenerator(in: baseURL)
            try generator.generate()
            Process.launchedProcess(launchPath: "/usr/bin/env", arguments: ["open", baseURL.path])
        } catch {
            XCTFail("\(error)")
        }
    }

    private func diff(lhs: String, rhs: String) throws -> Bool {

        let temp = FileManager.default.temporaryDirectory

        let lhsURL = temp.appendingPathComponent(UUID().uuidString)
        let rhsURL = temp.appendingPathComponent(UUID().uuidString)

        NSLog("lhs: \(lhsURL)")
        NSLog("rhs: \(rhsURL)")

        try lhs.write(to: lhsURL, atomically: true, encoding: .utf8)
        try rhs.write(to: rhsURL, atomically: true, encoding: .utf8)

        return try diff(url: lhsURL, with: rhsURL)
    }

    private func diff(url: URL, with otherURL: URL) throws -> Bool {
        let process = Process()
        process.launchPath = "/usr/bin/env"
        process.arguments = [
            "diff",
            url.standardized.path,
            otherURL.standardized.path
        ]
        try process.run()
        process.waitUntilExit()
        return process.terminationStatus == EXIT_SUCCESS
    }
    
    func rootDirURL() -> URL {
        return URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }
}
