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
            do { try find(atPath: path) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
    
    private func find(atPath path: String) throws {
        guard let node = environment.currentDirectory.getNode(atPath: path) else {
            throw Errors.nodeNotFound(name: path)
        }
        
        find(node: node)
    }
    
    private func find(node: Node) {
        print(node.path)
        
        (node as? DirectoryProtocol)?.nodes.forEach { node in
            find(node: node)
        }
    }
}
