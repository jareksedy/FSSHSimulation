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
    
    func add(node: Node) {
        add(nodes: [node])
    }
    
    func add(nodes: [Node]) {
        nodes.forEach { node in
            node.parent = self
            self.nodes.append(node)
        }
    }
    
    func remove(node: Node) {
        remove(nodes: [node])
    }
    
    func remove(nodes: [Node]) {
        nodes.forEach { node in
            node.parent = nil
            self.nodes.removeAll(where: { $0 === node })
        }
    }
}
