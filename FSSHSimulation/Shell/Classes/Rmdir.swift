//
//  Rmdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 18.03.2023.
//

final class Rmdir: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageDirectoryName
        }
        
        arguments.forEach { argument in
            do { try removeDirectory(atPath: argument) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func removeDirectory(atPath path: String) throws {
        guard let targetDirectory = environment.currentDirectory.getNode(atPath: path) as? DirectoryProtocol,
              let parentDirectory = targetDirectory.parent else {
            throw Errors.nodeNotFound(name: path)
        }
        
        do {
            try parentDirectory.remove(node: targetDirectory)
            
            if targetDirectory === environment.currentDirectory {
                environment.currentDirectory = parentDirectory
            }
        }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}
