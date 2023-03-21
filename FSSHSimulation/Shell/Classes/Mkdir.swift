//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Mkdir: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageDirectoryName
        }
        
        arguments.forEach { argument in
            do { try makeDirectory(atPath: argument) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func makeDirectory(atPath path: String) throws {
        let targetDirectoryName = path.stripPath()
        let parentDirectoryName = path.stripFilename()
        
        guard let targetDirectory = environment.currentDirectory.getNode(atPath: parentDirectoryName) as? DirectoryProtocol else {
            throw Errors.nodeNotFound(name: path)
        }
        
        do { try targetDirectory.add(node: Directory(name: targetDirectoryName)) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}
