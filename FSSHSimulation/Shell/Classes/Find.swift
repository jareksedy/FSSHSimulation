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
        
        do {
            try arguments.forEach { path in
                guard let node = environment.currentDirectory.getNode(atPath: path) else {
                    throw Errors.nodeNotFound(name: path)
                }
                
                find(node: node)
            }
        }
    }
    
    private func find(node: Node) {
        print(node.path)
        
        guard let node = node as? DirectoryProtocol else { return }
        
        node.nodes.forEach { node in
            find(node: node)
        }
    }
}
