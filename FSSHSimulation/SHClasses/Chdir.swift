//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Chdir: AbstractCommand {
    override func run(arguments: [String]) {
        guard let argument = arguments.first else {
            print(Strings.Messages.usageDirectoryName.format(commandName))
            return
        }
        
        guard arguments.count == 1 else {
            print(Strings.Messages.tooManyArguments.format(commandName))
            return
        }
        
        if argument.isPath() {
            print("Looks like a path")
        } else {
            switch argument {
            case Globals.levelUp:
                environment.currentDirectory = environment.currentDirectory.parent ?? environment.rootDirectory
                
            default:
                if let node = currentDirectory.getNode(by: argument) {
                    environment.currentDirectory = node
                } else {
                    print(Strings.Messages.noSuchFileOrDirectory.format(commandName, argument))
                    return
                }
            }
        }
    }
}
