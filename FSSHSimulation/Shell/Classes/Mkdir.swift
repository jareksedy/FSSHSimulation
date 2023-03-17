//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Mkdir: CommandProtocol {
    func main(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(Messages.usageDirectoryName.format(commandName))
            return
        }
        
        arguments.forEach { argument in
            argument.isPath() ? mkdir(path: argument) : mkdir(name: argument)
        }
    }
    
    private func mkdir(name: String) {
        let directory = Directory(name: name)
        
        guard environment.currentDirectory.add(node: directory) else {
            print(Messages.fileExists.format(commandName, name))
            return
        }
    }
    
    private func mkdir(path: String) {
        guard let targetDirectoryName = path.stripPath(), let parentDirectoryName = path.stripFilename() else { return }
        
        guard let targetDirectory = environment.rootDirectory.getNode(by: parentDirectoryName) as? DirectoryProtocol else {
            print(Messages.noSuchFileOrDirectory.format(commandName, targetDirectoryName.stripPath() ?? .empty))
            return
        }
        
        let directory = Directory(name: targetDirectoryName)
        
        guard targetDirectory.add(node: directory) else {
            print(Messages.fileExists.format(commandName, path))
            return
        }
    }
}
