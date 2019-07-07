//
//  File.swift
//
//
//  Created by Roman Dzieciol on 6/23/19.
//

import Foundation


import Foundation
import SwiftSyntax
import SwiftSyntaxDSL

public class SwiftTextEmitter {

    let model: FormatModel
    let formatter: SyntaxRewriter

    public init(model: FormatModel, formatter: SyntaxRewriter) throws {
        self.model = model
        self.formatter = formatter
    }

    public func emitAll(to baseURL: URL) throws {

        let namespaceSyntax = formatter.visit(namespaceDecl(version: model.version))
        try write(syntax: namespaceSyntax, to: baseURL.appendingPathComponent(model.version).appendingPathExtension("swift"))

        try model.allTypes().forEach { pair in
            let (typeName, type) = pair
            let syntax = try emit(type: type)
            let outputURL = baseURL.appendingPathComponent(typeName).appendingPathExtension("swift")
            try write(syntax: syntax, to: outputURL)
        }
    }

    public func emit(type: TopLevelType) throws -> Syntax {
        let syntaxEmitter = try SwiftSyntaxEmitter(type: type, version: model.version)
        let syntax = syntaxEmitter.source()
        let formattedSyntax = formatter.visit(syntax)
        return formattedSyntax
    }

    func write(syntax: Syntax, to outputURL: URL) throws {
        var output = ""
        syntax.write(to: &output)
        try output.write(to: outputURL, atomically: true, encoding: .utf8)
    }

    public func namespaceDecl(version: String) -> SourceFile {
        return SourceFile {
            EnumDecl(version, nil, [])
                .public
        }
    }
}



