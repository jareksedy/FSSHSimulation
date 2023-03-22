//
//  Cat.swift
//  FSSHSimulation
//
//  Created by Ярослав on 22.03.2023.
//

final class Cat: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageFiles
        }
        
        arguments.forEach { path in
            do { try concatenate(atPath: path) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func concatenate(atPath path: String) throws {
        guard (environment.currentDirectory.getNode(atPath: path) as? Directory) == nil else {
            throw Errors.isADirectory(name: path)
        }
        
        guard let node = environment.currentDirectory.getNode(atPath: path) as? FileProtocol else {
            throw Errors.nodeNotFound(name: path)
        }
        
        if let contents = node.read()?.toString() {
            print(contents)
        }
    }
}
