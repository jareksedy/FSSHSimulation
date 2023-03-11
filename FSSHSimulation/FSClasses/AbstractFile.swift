//
//  AbstractFile.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class AbstractFile {
    var parent: AbstractFile?
    var path: String {
        return nodes.count == 1 ?
        pathSeparator :
        nodes.map { $0.name }.joined(separator: pathSeparator)
    }
    
    private let pathSeparator = "/"
    private(set) var name: String
    private var nodes: [AbstractFile] {
        var nodes = [self]
        var node = parent
        
        while node != nil {
            nodes.append(node!)
            node = parent
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
}
