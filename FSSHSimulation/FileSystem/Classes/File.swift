//
//  File.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 22.03.2023.
//

import Foundation

final class File: FileProtocol {
    var parent: Directory?
    var name: String
    
    internal var contents: Data?
    
    init(name: String) {
        self.name = name
    }
    
    func write(_ data: Data?) throws {
        contents = data
    }
    
    func read() -> Data? {
        contents
    }
}
