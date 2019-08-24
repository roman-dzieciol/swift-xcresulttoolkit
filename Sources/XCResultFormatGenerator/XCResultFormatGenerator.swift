//
//  XCResultFormatGenerator.swift
//  XCResultFormatGenerator
//
//  Created by Roman Dzieciol on 8/5/19.
//

import Foundation
import XCResultToolKit
import SWLintKit

public struct XCResultFormatGenerator {
    
    let baseURL: URL
    
    public init(in baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func generate() throws {
        
        let kit = XCResultToolKit()
        let data = try kit.formatDescription(args: [])
        let formatDescription = try JSONDecoder().decode(FormatDescription.self, from: data)
        let importer = FormatModelImporter()
        let formatModel = try importer.formatModel(from: formatDescription.withSchemaFixes())
        
        let formatter = SWFormatter()
        let emitter = try SwiftTextEmitter(model: formatModel, formatter: formatter)
        
        let outputURL = baseURL
            .appendingPathComponent("Sources/XCResultToolFormatDescription")
            .appendingPathComponent(formatDescription.version.namespace)
        try FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: true)
        
        try updatePackage()
        
        try emitter.emitAll(to: outputURL)
    }
    
    func updatePackage() throws {
        
        let templateBaseURL = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("FormatTemplate")
        
        try overwrite(url: baseURL.appendingPathComponent("Sources/XCResultToolFormatDescription/CodableSupport"),
                      with: templateBaseURL.appendingPathComponent("Sources/XCResultToolFormatDescription/CodableSupport"))
        try overwrite(url: baseURL.appendingPathComponent(".gitignore"),
                      with: templateBaseURL.appendingPathComponent(".gitignore"))
        try overwrite(url: baseURL.appendingPathComponent("Package.swift"),
                      with: templateBaseURL.appendingPathComponent("Package.swift.template.txt"))
    }
    
    func overwrite(url destination: URL, with source: URL) throws {
        do {
            try FileManager.default.removeItem(at: destination)
        } catch CocoaError.fileNoSuchFile {
        }
        try FileManager.default.createDirectory(at: destination.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
        try FileManager.default.copyItem(at: source, to: destination)
    }
    
}
