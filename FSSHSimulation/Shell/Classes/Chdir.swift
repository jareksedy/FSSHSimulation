//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Chdir: CommandProtocol {
    func main(arguments: [String]) {
        guard let path = arguments.first else {
            print(Messages.usageDirectoryName.format(commandName))
            return
        }
        
        guard arguments.count == 1 else {
            print(Messages.tooManyArguments.format(commandName))
            return
        }
        
        guard let directory = environment.currentDirectory.getNode(by: path) as? Directory else {
            print(Messages.noSuchFileOrDirectory.format(commandName, path))
            return
        }
        
        environment.currentDirectory = directory
    }
    
    required init() {}
}
