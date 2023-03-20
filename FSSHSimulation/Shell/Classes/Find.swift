//
//  Find.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Find: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageDirectoryName
        }
        
        arguments.forEach { path in
            let node = environment.currentDirectory.getNode(atPath: path)
            do { try find(node: node) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func find(node: Node?) throws {
        guard let node = node as? DirectoryProtocol else {
            throw Errors.nodeNotFound(name: node?.name ?? .empty)
        }
        
        print(node.path)
        
        node.nodes.forEach { node in
            do { try find(node: node) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
}
