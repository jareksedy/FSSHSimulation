//
//  Pwd.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Pwd: CommandProtocol {
    func run(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Strings.Messages.tooManyArguments.format(commandName))
            return
        }
        
        print(environment.currentDirectory.path)
    }
}
