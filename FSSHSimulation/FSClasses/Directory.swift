//
//  Directory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class Directory: AbstractFile {
    private(set) var files: [AbstractFile] = []
    
    override func list(withPath: Bool = true) {
        print(withPath ? path : name)
        
        files.forEach { file in
            file.list(withPath: withPath)
        }
    }
    
    override func getNode(by path: String) -> AbstractFile? {
        guard path != "" else { return self }
        let tokens = path.tokenize()
        guard let token = tokens.first else { return self }
        
        let next = tokens.dropFirst().joined(separator: .slash)
        
        var pointer: AbstractFile? = self
        
        switch token {
        case .empty:
            pointer = root
        case .tilde:
            pointer = home
        case .doubleDot:
            pointer = parent == nil ? self : parent
        default:
            pointer = hasNode(name: token)
        }
        
        return pointer?.getNode(by: next)
    }
    
    func hasNode(name: String) -> AbstractFile? {
        return files.first(where: { $0.name == name })
    }
    
    func add(file: AbstractFile) {
        add(files: [file])
    }
    
    func add(files: [AbstractFile]) {
        files.forEach { file in
            self.files.append(file)
            file.parent = self
        }
    }
    
    func remove(file: AbstractFile) {
        remove(files: [file])
    }
    
    func remove(files: [AbstractFile]) {
        files.forEach { file in
            self.files.removeAll(where: { $0 === file })
            file.parent = nil
        }
    }
}
