//
//  FileSystemNode.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 14.03.2023.
//

protocol FileSystemNode: AnyObject {
    var parent: Directory? { get set }
    var name: String { get set }
    
    func getNode(by path: String) -> FileSystemNode?
    func hasNode(name: String) -> FileSystemNode?
    func add(node: FileSystemNode)
    func add(nodes: [FileSystemNode])
    func remove(node: FileSystemNode)
    func remove(nodes: [FileSystemNode])
}

extension FileSystemNode {
    private var nodes: [FileSystemNode] {
        return sequence(first: self, next: { $0.parent }).reversed()
    }
    
    var directoryName: String {
        let name = nodes.last(where: { $0 is Directory })?.name
        return name == nil || name == "" ? .slash : name!
    }
    
    var path: String {
        return nodes.count == 1 ? .slash : nodes.map { $0.name }.joined(separator: .slash)
    }
    
    var home: FileSystemNode? {
        return getNode(by: "/home/root")
    }
    
    var root: FileSystemNode? {
        return nodes.first
    }
    
    func getNode(by path: String) -> FileSystemNode? {
        guard path != "" else { return self }
        let tokens = path.tokenize()
        guard let token = tokens.first else { return self }
        
        let next = tokens.dropFirst().joined(separator: .slash)
        
        var pointer: FileSystemNode? = self
        
        switch token {
        case .empty:
            pointer = root
        case .tilde:
            pointer = home
        case .dot:
            pointer = self
        case .doubleDot:
            pointer = parent == nil ? self : parent
        default:
            pointer = hasNode(name: token)
        }
        
        return pointer?.getNode(by: next)
    }
}
