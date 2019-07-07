import XCTest
import XCResultToolKit
import SwiftSyntax
import SWLintKit

final class XCResultToolKitTests: XCTestCase {


    func testExample() {
        do {

            let kit = XCResultToolKit()
            let data = try kit.formatDescription(args: [])
            let formatDescription = try JSONDecoder().decode(V3_19.FormatDescription.self, from: data)
            let importer = V3_19.FormatModelImporter()
            let formatModel = try importer.formatModel(from: formatDescription)

            let formatter = SWFormatter()
            let emitter = try SwiftTextEmitter(model: formatModel, formatter: formatter)

            let baseURL = rootDirURL()
                .appendingPathComponent(formatDescription.version.namespace)

            try FileManager.default.createDirectory(at: baseURL, withIntermediateDirectories: true)

            try emitter.emitAll(to: baseURL)
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

    static var allTests = [
        ("testExample", testExample),
    ]
}
