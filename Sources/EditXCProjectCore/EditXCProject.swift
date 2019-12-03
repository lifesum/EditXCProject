//
//  EditXCProject.swift
//  
//
//  Created by Georgii on 2019-12-03.
//

import Foundation
import XcodeEdit

public final class EditXCProject {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        guard arguments.count > 1 else {
            throw Error.missingFilePath
        }
        
        let filePath = arguments[1]
        
        let xcodeproj = URL(fileURLWithPath: filePath)
        
        let proj = try! XCProjectFile(xcodeprojURL: xcodeproj)

        do {
            try proj.write(to: xcodeproj, format: PropertyListSerialization.PropertyListFormat.openStep)
        } catch {
            throw Error.failedToConvertFile
        }
    }
}

public extension EditXCProject {
    enum Error: Swift.Error {
        case missingFilePath
        case failedToConvertFile
    }
}
