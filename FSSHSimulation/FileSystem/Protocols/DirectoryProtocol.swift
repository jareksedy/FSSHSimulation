//
//  DirectoryProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

protocol DirectoryProtocol: Node {
    var nodes: [Node] { get }
    
    func getNode(withName name: String) -> Node?
    func getNode(atPath path: String) -> Node?
    
    func add(node: Node) throws
    func remove(node: Node) throws
}

extension DirectoryProtocol {
    var home: Node? {
        getNode(atPath: .homeDirectory)
    }
    
    func getNode(withName name: String) -> Node? {
        nodes.first(where: { $0.name == name })
    }
    
    func getNode(atPath path: String) -> Node? {
        let tokens = path.tokenize()
        var pointer: Node? = self
        
        guard !path.isEmpty, let token = tokens.first else { return self }
        
        switch token {
        case .empty: pointer = root
        case .tilde: pointer = home
        case .dot: pointer = self
        case .doubleDot: pointer = parent ?? self
        default: pointer = getNode(withName: token)
        }
        
        let pathNext = tokens.dropFirst().joined(separator: .slash)
        
        return pathNext == .empty ? pointer :
        (pointer as? DirectoryProtocol)?.getNode(atPath: pathNext) ??
        (pointer as? DirectoryProtocol)?.getNode(withName: pathNext)
    }
}
