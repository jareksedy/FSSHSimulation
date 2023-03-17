//
//  Node.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 14.03.2023.
//

protocol Node: AnyObject {
    var parent: Directory? { get set }
    var name: String { get set }
    
    func hasNode(name: String) -> Node?
    func getNode(by path: String) -> Node?
}

extension Node {
    var nodes: [Node] {
        sequence(first: self, next: { $0.parent }).reversed()
    }
    
    var root: Node? {
        nodes.first
    }
    
    var home: Node? {
        getNode(by: .homeDirectory)
    }
    
    var path: String {
        nodes.count == 1 ? .slash : nodes.map { $0.name }.joined(separator: .slash)
    }
    
    func getNode(by path: String) -> Node? {
        let tokens = path.tokenize()
        guard !path.isEmpty, let token = tokens.first else { return self }
        
        var pointer: Node? = self
        
        switch token {
        case .empty: pointer = root
        case .tilde: pointer = home
        case .dot: pointer = self
        case .doubleDot: pointer = parent ?? self
        default: pointer = hasNode(name: token)
        }
        
        let next = tokens.dropFirst().joined(separator: .slash)
        return pointer?.getNode(by: next)
    }
}
