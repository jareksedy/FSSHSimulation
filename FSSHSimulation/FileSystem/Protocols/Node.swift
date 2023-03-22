//
//  Node.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 14.03.2023.
//

protocol Node: AnyObject {
    var parent: DirectoryProtocol? { get set }
    var name: String { get set }
}

extension Node {
    var nodes: [Node] {
        sequence(first: self, next: { $0.parent }).reversed()
    }
    
    var root: Node? {
        nodes.first
    }
    
    var path: String {
        nodes.count == 1 ? .slash : nodes.map { $0.name }.joined(separator: .slash)
    }
}
