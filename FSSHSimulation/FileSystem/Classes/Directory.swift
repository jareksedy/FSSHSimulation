//
//  Directory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Directory: DirectoryProtocol {
    weak var parent: Directory?
    var name: String
    
    internal var nodes: [Node] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(node: Node?) throws {
        guard let node = node else {
            throw Errors.nodeNotFound
        }
        
        guard node.name.isValid() else {
            throw Errors.invalidFileName(name: node.name)
        }
        
        guard getNode(withName: node.name) == nil else {
            throw Errors.nodeExists(name: node.name)
        }
        
        nodes.append(node)
        node.parent = self
    }
    
    func remove(node: Node?) throws {
        guard let node = node, let index = nodes.firstIndex(where: { $0 === node }) else {
            throw Errors.nodeNotFound
        }
        
        guard let directory = node as? DirectoryProtocol, directory.nodes.isEmpty else {
            throw Errors.nodeNotEmpty(name: node.name)
        }
        
        nodes.remove(at: index)
        node.parent = nil
    }
}
