//
//  DirectoryProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

protocol DirectoryProtocol: Node {
    var nodes: [Node] { get }
    
    func nodeWithName(_ name: String) -> Node?
    func getNodeAtPath(_ path: String) -> Node?
    
    @discardableResult func add(node: Node) -> Bool
    @discardableResult func remove(node: Node) -> Bool
}

extension DirectoryProtocol {
    var home: Node? {
        getNodeAtPath(.homeDirectory)
    }
    
    func nodeWithName(_ name: String) -> Node? {
        nodes.first(where: { $0.name == name })
    }
    
    func getNodeAtPath(_ path: String) -> Node? {
        let tokens = path.tokenize()
        var pointer: Node? = self
        
        guard !path.isEmpty, let token = tokens.first else { return self }
        
        switch token {
        case .empty: pointer = root
        case .tilde: pointer = home
        case .dot: pointer = self
        case .doubleDot: pointer = parent ?? self
        default: pointer = nodeWithName(token)
        }
        
        let pathNext = tokens.dropFirst().joined(separator: .slash)
        return (pointer as? DirectoryProtocol)?.getNodeAtPath(pathNext)
    }
}
