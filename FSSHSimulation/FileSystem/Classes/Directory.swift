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
        guard nodeWithName(node.name) == nil else { return false }
        
        self.nodes.append(node)
        node.parent = self
        
        return true
    }
    
    @discardableResult func remove(node: Node) -> Bool {
        guard nodeWithName(node.name) != nil else { return false }
        
        self.nodes.removeAll(where: { $0 === node })
        node.parent = nil
        
        return true
    }
}
