//
//  DirectoryProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

protocol DirectoryProtocol: Node {
    var nodes: [Node] { get }
    
    func hasNode(name: String) -> Node?
    func getNode(by path: String) -> Node?
    
    @discardableResult func add(node: Node) -> Bool
    @discardableResult func remove(node: Node) -> Bool
}

extension DirectoryProtocol {
    var home: Node? {
        getNode(by: .homeDirectory)
    }
    
    func hasNode(name: String) -> Node? {
        nodes.first(where: { $0.name == name })
    }
    
    func getNode(by path: String) -> Node? {
        let tokens = path.tokenize()
        var pointer: Node? = self
        
        guard !path.isEmpty, let token = tokens.first else { return self }
        
        switch token {
        case .empty: pointer = root
        case .tilde: pointer = home
        case .dot: pointer = self
        case .doubleDot: pointer = parent ?? self
        default: pointer = hasNode(name: token)
        }
        
        let pathNext = tokens.dropFirst().joined(separator: .slash)
        return (pointer as? DirectoryProtocol)?.getNode(by: pathNext)
    }
}
