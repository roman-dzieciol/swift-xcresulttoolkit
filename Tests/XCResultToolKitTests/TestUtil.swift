//
//  File.swift
//  
//
//  Created by Roman Dzieciol on 6/28/19.
//

import XCTest

extension XCTestCase {

    func rootDirURL() -> URL {
        return URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }

}
