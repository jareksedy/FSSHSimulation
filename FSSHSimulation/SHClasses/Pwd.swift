//
//  Pwd.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

fileprivate enum Messages {
    static let tooManyArguments = "%@: too many arguments"
}

final class Pwd: AbstractCommand {
    override func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Messages.tooManyArguments.format(commandName))
            return
        }
        
        print(environment.currentDirectory.path)
    }
}
