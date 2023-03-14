//
//  Directory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Directory: FileSystemNode {
    weak var parent: Directory?
    var name: String
    
    private(set) var nodes: [FileSystemNode] = []
    
    init(name: String) {
        self.name = name
    }
    
    func hasNode(name: String) -> FileSystemNode? {
        return nodes.first(where: { $0.name == name })
    }
    
    func add(node: FileSystemNode) {
        add(nodes: [node])
    }
    
    func add(nodes: [FileSystemNode]) {
        nodes.forEach { node in
            self.nodes.append(node)
            node.parent = self
        }
    }
    
    func remove(node: FileSystemNode) {
        remove(nodes: [node])
    }
    
    func remove(nodes: [FileSystemNode]) {
        nodes.forEach { node in
            node.parent = nil
            self.nodes.removeAll(where: { $0 === node })
        }
    }
}
