

import XCTest
import XCResultToolKit
import XCResultFormatGenerator
import SwiftSyntax
import SWLintKit

final class XCResultFormatGeneratorTests: XCTestCase {



    func testExample() {
        do {

            let generator = XCResultFormatGenerator()
            let baseURL = rootDirURL()
                .appendingPathComponent("Sources")
                .appendingPathComponent("XCResultFormatDescription")

            try generator.generate(in: baseURL)
//
//
//            let originalSource = try SyntaxTreeParser.parse(sampleURL)
//            var originalText = ""
//            originalSource.write(to: &originalText)
//
//            let tempURL = rootDirURL().appendingPathComponent("Temp")
//            try FileManager.default.createDirectory(at: tempURL, withIntermediateDirectories: true, attributes: nil)
//
//            var syntaxText = ""
//            let syntaxPrinter = SWSyntaxPrinter<String>()
//            let _ = syntaxPrinter.write(generatedSource, to: &syntaxText)
//
//
//            try syntaxText.write(to: tempURL.appendingPathComponent("Syntax.swift"), atomically: true, encoding: .utf8)
//            try generatedText.write(to: tempURL.appendingPathComponent("Generated.swift"), atomically: true, encoding: .utf8)
//            try originalText.write(to: tempURL.appendingPathComponent("Original.swift"), atomically: true, encoding: .utf8)
//
//
//            NSLog("\(originalText)")
//            NSLog("\(generatedText)")
//
//            XCTAssertTrue(try diff(lhs: generatedText, rhs: originalText))
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
