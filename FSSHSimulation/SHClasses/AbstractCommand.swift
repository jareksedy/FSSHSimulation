//
//  AbstractCommand.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

class AbstractCommand {
    var parent: AbstractFile?
    
    required init(parent: AbstractFile? = nil) {
        self.parent = parent
    }
    
    func run(arguments: [String]) {
        fatalError("Implement this method in child class.")
    }
}
