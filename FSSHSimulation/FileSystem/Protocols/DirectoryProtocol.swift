//
//  DirectoryProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

protocol DirectoryProtocol: Node {
    var nodes: [Node] { get }
    
    func add(node: Node)
    func add(nodes: [Node])
    func remove(node: Node)
    func remove(nodes: [Node])
}

extension DirectoryProtocol {
    func hasNode(name: String) -> Node? {
        nodes.first(where: { $0.name == name })
    }
}
