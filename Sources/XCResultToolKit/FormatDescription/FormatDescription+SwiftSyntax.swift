//
//  File.swift
//  
//
//  Created by Roman Dzieciol on 7/6/19.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxDSL


public extension Property {

    var simpleType: TypeSyntax {
        var variableType: TypeSyntax = SimpleTypeIdentifier(type)

        if isArray {
            variableType = ArrayType { variableType }
        }

        if isOptional {
            variableType = OptionalType { variableType }
        }

        return variableType
    }

    var identifierExpr: ExprSyntax {
        var result: ExprSyntax = IdentifierExpr(type)

        if isArray {
            result = ArrayExpr { result }
        }

        if isOptional {
            result = SyntaxFactory.makeOptionalChainingExpr(
                expression: result,
                questionMark: SyntaxFactory.makePostfixQuestionMarkToken())
        }

        return result
    }
}

