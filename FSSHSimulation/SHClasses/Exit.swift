//
//  Exit.swift
//  FSSHSimulation
//
//  Created by Ярослав on 12.03.2023.
//

class Exit: AbstractCommand {
    override func run(arguments: [String]) {
        environment.isRunning = false
    }
}
