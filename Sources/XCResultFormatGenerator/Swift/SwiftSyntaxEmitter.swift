
import Foundation
import SwiftSyntax
import SwiftSyntaxDSL

public class SwiftSyntaxEmitter {

    let version: String
    let type: TopLevelType

    var properties: [Property] { return type.properties }
    var allProperties: [Property] { return type.allProperties }
    var allSuperProperties: [Property] { return type.allSuperProperties }

    public init(type: TopLevelType, version: String) throws {
        self.version = version
        self.type = type
    }

    public func source() -> SourceFile {
        SourceFile {
            ImportDecl("Foundation")
            Public {
                ExtensionDecl(SimpleTypeIdentifier(version)) {
                    classDecl()
                }
            }
        }
    }

    func classDecl() -> ClassDecl {

        var members: [DeclSyntax] = []

        members += properties.map {
            VariableDecl(.let, IdentifierPattern($0.name), type: $0.simpleType)
                .public
        }

        members.append(
            EnumDecl("CodingKeys", [SimpleTypeIdentifier("CodingKey")], properties.map { $0.name })
                .private
        )
        
        let override: [DeclModifier] = type.supertype != nil ? [DeclModifier.override] : []
        
        let overrideInit: [DeclModifier] = type.supertype != nil && allProperties.count == allSuperProperties.count ? [DeclModifier.override] : []

        let initDecl = InitializerDecl(params: allProperties.map { FunctionParameter($0.name, type: $0.simpleType) })
            .public
            .addModifiers {
                overrideInit
            }
            .setCodeBlock {
                properties.map { property -> Syntax in
                    let name = property.name
                    return SequenceExpr {
                        MemberAccessExpr(self: name)
                        AssignmentExpr()
                        IdentifierExpr(name)
                    }
                }
                if type.supertype != nil {
                    FunctionCallExpr(MemberAccessExpr(super: "init"), allSuperProperties.map { property in
                        FunctionCallArgument(property.name, IdentifierExpr(property.name))

                    })
                }
        }

        members.append(
            initDecl
        )

        members.append(
            InitializerDecl(params: .init("from", "decoder", type: SimpleTypeIdentifier("Decoder")))
                .public
                .throws
                .required
                .setCodeBlock {
                    if !properties.isEmpty {
                        [VariableDecl(.let, IdentifierPattern("container"), value: TryExpr {
                            FunctionCallExprSyntax(
                                MemberAccessExpr("decoder", "container"),
                                FunctionCallArgument("keyedBy", MemberAccessExpr("CodingKeys", .selfKeyword))
                            )
                        })]
                        properties.map { property -> Syntax in
                            let name = property.name
                            return SequenceExpr {
                                IdentifierExpr(name)
                                AssignmentExpr()
                                property.decodeCall()
                            }
                        }
                    }
                    if type.supertype != nil {
                        [TryExpr {
                            FunctionCallExprSyntax(
                                MemberAccessExpr(super: "init"),
                                FunctionCallArgument("from", IdentifierExpr("decoder"))
                            )
                            }
                        ]
                    }
            }
        )

        members.append(
            FunctionDecl("encode", FunctionParameter("to", "encoder", type: SimpleTypeIdentifier("Encoder")))
                .public
                .throws
                .addModifiers {
                    override
                }
                .setCodeBlock {
                    if type.supertype != nil {
                        [TryExpr {
                            FunctionCallExprSyntax(
                                MemberAccessExpr(super: "encode"),
                                FunctionCallArgument("to", IdentifierExpr("encoder"))
                            )
                            }
                        ]
                    }
                    if !properties.isEmpty {
                        [VariableDecl(.var, IdentifierPattern("container"), value:
                            FunctionCallExprSyntax(
                                MemberAccessExpr("encoder", "container"),
                                FunctionCallArgument("keyedBy", MemberAccessExpr("CodingKeys", .selfKeyword))
                            )
                            )
                        ]
                        properties.map { property in
                            TryExpr {
                                FunctionCallExprSyntax(
                                    MemberAccessExpr("container", property.isOptional ? "encodeIfPresent" : "encode"),
                                    FunctionCallArgument(nil, IdentifierExpr(property.name)),
                                    FunctionCallArgument("forKey", MemberAccessExpr(property.name))
                                )
                            }
                        }
                    }
            }
        )

        return ClassDecl(type.name, inherits: [SimpleTypeIdentifier(type.supertype?.name ?? "Codable")]) {
            members
        }

    }
}
