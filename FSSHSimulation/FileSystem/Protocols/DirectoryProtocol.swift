//
//  DirectoryProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

protocol DirectoryProtocol: Node {
    var nodes: [Node] { get }
    
    @discardableResult func add(node: Node) -> Bool
    @discardableResult func remove(node: Node) -> Bool
}

extension DirectoryProtocol {
    func hasNode(name: String) -> Node? {
        nodes.first(where: { $0.name == name })
    }
}
