//
//  Find.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class Find: AbstractCommand {
    override func run(arguments: [String]) {
        environment.rootDirectory.list()
    }
}
