//
//  Pwd.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Pwd: CommandProtocol {
    func main(arguments: [String]) {
        guard arguments.isEmpty else {
            print(Messages.tooManyArguments.format(commandName))
            return
        }
        
        print(environment.currentDirectory.path)
    }
}
