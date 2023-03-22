//
//  Rm.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 22.03.2023.
//

final class Rm: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageFiles
        }
        
        arguments.forEach { path in
            do { try removeFile(atPath: path) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func removeFile(atPath path: String) throws {
        guard (environment.currentDirectory.getNode(atPath: path) as? DirectoryProtocol) == nil else {
            throw Errors.isADirectory(name: path)
        }
        
        guard let file = environment.currentDirectory.getNode(atPath: path) as? FileProtocol,
              let parentDirectory = file.parent else {
            throw Errors.nodeNotFound(name: path)
        }
        
        do { try parentDirectory.remove(node: file) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}
