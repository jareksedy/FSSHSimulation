//
//  Exit.swift
//  FSSHSimulation
//
//  Created by Ярослав on 12.03.2023.
//

final class Exit: AbstractCommand {
    override func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Strings.Messages.tooManyArguments.format(commandName))
            return
        }
        
        environment.isRunning = false
    }
}

