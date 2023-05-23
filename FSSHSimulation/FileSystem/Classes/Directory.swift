//
//  Directory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Directory: DirectoryProtocol {
    weak var parent: DirectoryProtocol?
    var name: String
    
    var nodes: [Node] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(node: Node) throws {
        guard node.name.isValid() else {
            throw Errors.invalidFileName(name: node.name)
        }
        
        guard getNode(withName: node.name) == nil else {
            throw Errors.nodeExists(name: node.name)
        }
        
        nodes.append(node)
        node.parent = self
    }
    
    func remove(node: Node) throws {
        guard let index = nodes.firstIndex(where: { $0 === node }) else {
            throw Errors.nodeNotFound(name: node.name)
        }

        guard let directory = node as? DirectoryProtocol else {
            guard let file = node as? FileProtocol else {
                throw Errors.nodeNotFound(name: node.name)
            }
            
            nodes.remove(at: index)
            file.parent = nil
            return
        }

        guard directory.nodes.isEmpty else {
            throw Errors.nodeNotEmpty(name: node.name)
        }

        nodes.remove(at: index)
        directory.parent = nil
    }
}
