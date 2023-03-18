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
    
    @discardableResult func add(node: Node) -> Bool {
        guard hasNode(name: node.name) == nil else { return false }
        node.parent = self
        self.nodes.append(node)
        return true
    }
    
    @discardableResult func remove(node: Node) -> Bool {
        guard hasNode(name: node.name) != nil else { return false }
        node.parent = nil
        self.nodes.removeAll(where: { $0 === node })
        return true
    }
}
