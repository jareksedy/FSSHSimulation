//
//  AbstractFile.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class AbstractFile {
    var parent: AbstractFile?
    var root: AbstractFile? {
        return nodes.first
    }
    var path: String {
        return nodes.count == 1 ?
        Globals.pathSeparator :
        nodes.map { $0.name }.joined(separator: Globals.pathSeparator)
    }
    var directoryName: String {
        let name = nodes.last(where: { $0 is Directory })?.name
        
        if name == nil || name == "" {
            return Globals.pathSeparator
        }
        
        return name!
    }
    
    private(set) var name: String
    private var nodes: [AbstractFile] {
        var nodes = [self]
        var node = parent
        
        while node != nil {
            nodes.append(node!)
            node = node?.parent
        }
        
        return nodes.reversed()
    }
    
    init(parent: AbstractFile? = nil, name: String) {
        self.parent = parent
        self.name = name
    }
    
    func list(withPath: Bool = true) {
        fatalError("Implement this method in child class.")
    }
    
    func getNode(by path: String, isInitial: Bool = true) -> AbstractFile? {
        fatalError("Implement this method in child class.")
    }
}
