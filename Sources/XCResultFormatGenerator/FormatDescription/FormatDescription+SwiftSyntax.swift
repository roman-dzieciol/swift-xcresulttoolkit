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
    
    func decodableType() -> ExprSyntax {
        if isValue {
            return
                MemberAccessExpr(
                    SpecializeExpr({ (b) in
                        b.useExpression(IdentifierExpr("_Value"))
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
            return MemberAccessExpr(nonOptional.identifierExpr, .selfKeyword)
        }
    }
    
    func decodeCall() -> ExprSyntax {
        if isValue {
            return
                TryExpr {
                    MemberAccessExpr(
                        OptionalChainingExpr({ (b) in
                            b.useExpression(FunctionCallExprSyntax(
                                MemberAccessExpr("container", isOptional ? "decodeIfPresent" : "decode"),
                                FunctionCallArgument(nil, decodableType()),
                                FunctionCallArgument("forKey", MemberAccessExpr(name))
                            ))
                            if isOptional {
                                b.useQuestionMark(SyntaxFactory.makePostfixQuestionMarkToken())
                            }
                        })
                        , "_value")
                    
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

