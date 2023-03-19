//
//  Rmdir.swift
//  FSSHSimulation
//
//  Created by Ярослав on 18.03.2023.
//

final class Rmdir: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageDirectoryName
        }
        
        arguments.forEach { argument in
            argument.isPath() ? rmdir(path: argument) : rmdir(name: argument)
        }
    }
    
    private func rmdir(name: String) {
        let directory = environment.currentDirectory.getNode(withName: name) as? DirectoryProtocol
        
        do { try environment.currentDirectory.remove(node: directory) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
    
    private func rmdir(path: String) {
        let targetDirectory = environment.currentDirectory.getNode(atPath: path) as? DirectoryProtocol
        let parentDirectory = targetDirectory?.parent
        
        do { try parentDirectory?.remove(node: targetDirectory) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
        
        if targetDirectory === environment.currentDirectory {
            environment.currentDirectory = parentDirectory ?? environment.rootDirectory
        }
    }
}
