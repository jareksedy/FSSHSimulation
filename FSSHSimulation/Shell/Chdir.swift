//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Chdir: CommandProtocol {
    required init() {}
    
    func run(arguments: [String]) {
        guard let path = arguments.first else {
            print(Strings.Messages.usageDirectoryName.format(commandName))
            return
        }
        
        guard arguments.count == 1 else {
            print(Strings.Messages.tooManyArguments.format(commandName))
            return
        }
        
        guard let directory = currentDirectory.getNode(by: path) as? Directory else {
            print(Strings.Messages.noSuchFileOrDirectory.format(commandName, path))
            return
        }
        
        environment.currentDirectory = directory
    }
}
