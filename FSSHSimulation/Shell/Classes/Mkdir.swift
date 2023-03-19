//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Mkdir: CommandProtocol {
    func main(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(Errors.usageDirectoryName.localizedDescription(commandName: commandName))
            return
        }
        
        arguments.forEach { argument in
            argument.isPath() ? mkdir(path: argument) : mkdir(name: argument)
        }
    }
    
    private func mkdir(name: String) {
        do { try environment.currentDirectory.add(node: Directory(name: name)) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
    
    private func mkdir(path: String) {
        let targetDirectoryName = path.stripPath()
        let parentDirectoryName = path.stripFilename()
        let startDirectory = parentDirectoryName == .empty ? environment.rootDirectory : environment.currentDirectory
        let targetDirectory = startDirectory.getNode(atPath: parentDirectoryName) as? DirectoryProtocol
        
        do { try targetDirectory?.add(node: Directory(name: targetDirectoryName)) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}
