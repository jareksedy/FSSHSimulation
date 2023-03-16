//
//  Exit.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Exit: CommandProtocol {
    func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Messages.tooManyArguments.format(commandName))
            return
        }
        
        environment.isRunning = false
    }
}
