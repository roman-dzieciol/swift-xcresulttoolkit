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
    
    public init() {}
    
    public func generate(in baseURL: URL) throws {
        let kit = XCResultToolKit()
        let data = try kit.formatDescription(args: [])
        let formatDescription = try JSONDecoder().decode(V3_20_Static.FormatDescription.self, from: data)
        let importer = V3_20_Static.FormatModelImporter()
        let formatModel = try importer.formatModel(from: formatDescription)
        
        let formatter = SWFormatter()
        let emitter = try SwiftTextEmitter(model: formatModel, formatter: formatter)
        
        let outputURL = baseURL.appendingPathComponent(formatDescription.version.namespace)
        try FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: true)
        
        try emitter.emitAll(to: outputURL)
    }
    
}
