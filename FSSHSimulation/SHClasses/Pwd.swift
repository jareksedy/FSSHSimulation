//
//  Pwd.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

fileprivate enum Messages {
    static let tooManyArguments = "pwd: too many arguments"
}

class Pwd: AbstractCommand {
    override func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Messages.tooManyArguments)
            return
        }
        
        print(environment.currentDirectory.path)
    }
}
