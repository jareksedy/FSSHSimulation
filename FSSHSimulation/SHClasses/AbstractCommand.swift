//
//  AbstractCommand.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

class AbstractCommand {
    let environment = Environment.shared
    
    required init() {}
    
    func run(arguments: [String]) {
        fatalError("Implement this method in child class.")
    }
}
