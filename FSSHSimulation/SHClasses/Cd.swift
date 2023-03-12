//
//  Cd.swift
//  FSSHSimulation
//
//  Created by Ярослав on 12.03.2023.
//

final class Cd: AbstractCommand {
    override func run(arguments: [String]) {
        Chdir().run(arguments: arguments)
    }
}
