//
//  File.swift
//  
//
//  Created by Roman Dzieciol on 7/7/19.
//

import Foundation

public class FormatModel {
    
    var topLevelTypesByName: [String: TopLevelType]

    public var version: String

    public init(version: String, topLevelTypesByName: [String: TopLevelType]) {
        self.version = version
        self.topLevelTypesByName = topLevelTypesByName
    }

    public func topLevelType(named name: String) -> TopLevelType? {
        return topLevelTypesByName[name]
    }

    public func allTypes() -> [String: TopLevelType] {
        return topLevelTypesByName
    }
}
