//
//  Exit.swift
//  FSSHSimulation
//
//  Created by Ярослав on 12.03.2023.
//

fileprivate enum Messages {
    static let tooManyArguments = "%@: too many arguments"
}

final class Exit: AbstractCommand {
    override func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Messages.tooManyArguments.format(commandName))
            return
        }
        
        environment.isRunning = false
    }
}

