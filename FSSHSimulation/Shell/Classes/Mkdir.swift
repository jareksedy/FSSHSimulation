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
        guard environment.currentDirectory.add(node: Directory(name: name)) else {
            print(Messages.fileExists.format(commandName, name))
            return
        }
    }
    
    private func mkdir(path: String) {
        guard let targetDirectoryName = path.stripPath(), let parentDirectoryName = path.stripFilename() else { return }
        
        let startDirectory = parentDirectoryName == .empty ? environment.rootDirectory : environment.currentDirectory
        
        guard let targetDirectory = startDirectory.getNode(by: parentDirectoryName) as? DirectoryProtocol else {
            print(Messages.noSuchFileOrDirectory.format(commandName, path))
            return
        }
        
        guard targetDirectory.add(node: Directory(name: targetDirectoryName)) else {
            print(Messages.fileExists.format(commandName, path))
            return
        }
    }
}
