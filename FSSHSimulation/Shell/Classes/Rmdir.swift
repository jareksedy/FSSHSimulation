//
//  Rmdir.swift
//  FSSHSimulation
//
//  Created by Ярослав on 18.03.2023.
//

final class Rmdir: CommandProtocol {
    func main(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(Messages.usageDirectoryName.format(commandName))
            return
        }
        
        arguments.forEach { argument in
            argument.isPath() ? rmdir(path: argument) : rmdir(name: argument)
        }
    }
    
    private func rmdir(name: String) {
        guard let directory = environment.currentDirectory.hasNode(name: name) as? DirectoryProtocol else {
            print(Messages.noSuchFileOrDirectory.format(commandName, name))
            return
        }
        
        guard directory.nodes.isEmpty else {
            print(Messages.directoryNotEmpty.format(commandName, name))
            return
        }
        
        environment.currentDirectory.remove(node: directory)
    }
    
    private func rmdir(path: String) {
        guard let targetDirectory = environment.currentDirectory.getNode(by: path) as? DirectoryProtocol,
              let parentDirectory = targetDirectory.parent else {
            print(Messages.noSuchFileOrDirectory.format(commandName, path))
            return
        }
        
        guard targetDirectory.nodes.isEmpty else {
            print(Messages.directoryNotEmpty.format(commandName, path))
            return
        }
        
        if targetDirectory === environment.currentDirectory {
            environment.currentDirectory = parentDirectory
        }
        
        parentDirectory.remove(node: targetDirectory)
    }
}

