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
    
    var nonOptionalIdentifierExpr: ExprSyntax {
        var result: ExprSyntax = IdentifierExpr(type)
        
        if isArray {
            result = ArrayExpr { result }
        }
        
        return result
    }
    
    var identifierExpr: ExprSyntax {
        var result = nonOptionalIdentifierExpr
        
        if isOptional {
            result = SyntaxFactory.makeOptionalChainingExpr(
                expression: result,
                questionMark: SyntaxFactory.makePostfixQuestionMarkToken())
        }
        
        return result
    }
    
    var schemaValueType: String? {
        if isArray {
            return "_Values"
        } else if isValue {
            return "_Value"
        } else {
            return nil
        }
    }
    
    var schemaValueKey: String? {
        if isArray {
            return "_values"
        } else if isValue {
            return "_value"
        } else {
            return nil
        }
    }
    
    func decodableType(_ schemaValueType: String? = nil) -> ExprSyntax {
        if let schemaValueType = schemaValueType {
            return
                MemberAccessExpr(
                    SpecializeExpr({ (b) in
                        b.useExpression(IdentifierExpr(schemaValueType))
                        b.useGenericArgumentClause(GenericArgumentClauseSyntax({ (b) in
                            b.useLeftAngleBracket(SyntaxFactory.makeLeftAngleToken())
                            b.useRightAngleBracket(SyntaxFactory.makeRightAngleToken())
                            b.addArgument(GenericArgumentSyntax({ (b) in
                                b.useArgumentType(SimpleTypeIdentifier(type))
                            }))
                        }))
                    }),
                    .selfKeyword)
        } else {
            return MemberAccessExpr(nonOptionalIdentifierExpr, .selfKeyword)
        }
    }
    
    func decodeCall() -> ExprSyntax {
        if let schemaValueType = self.schemaValueType, let schemaValueKey = self.schemaValueKey {
            return
                TryExpr {
                    MemberAccessExpr(
                        OptionalChainingExpr({ (b) in
                            b.useExpression(FunctionCallExprSyntax(
                                MemberAccessExpr("container", isOptional ? "decodeIfPresent" : "decode"),
                                FunctionCallArgument(nil, decodableType(schemaValueType)),
                                FunctionCallArgument("forKey", MemberAccessExpr(name))
                            ))
                            if isOptional {
                                b.useQuestionMark(SyntaxFactory.makePostfixQuestionMarkToken())
                            }
                        })
                        , schemaValueKey)
                    
            }
        } else {
            return
                TryExpr {
                    FunctionCallExprSyntax(
                        MemberAccessExpr("container", isOptional ? "decodeIfPresent" : "decode"),
                        FunctionCallArgument(nil, decodableType()),
                        FunctionCallArgument("forKey", MemberAccessExpr(name))
                    )
            }
        }
    }
}

