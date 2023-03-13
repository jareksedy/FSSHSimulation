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
    
    override func getNode(by path: String, isInitial: Bool = true) -> AbstractFile? {
        guard let token = path.tokenize().first else { return self }
        
        var pointer: AbstractFile? = self
        let pathTokens = path.tokenize()
        
        switch token {
        case Globals.pathSeparator:
            if isInitial { pointer = root }
            
        case Globals.homeDirectory:
            pointer = self.home
            
        case Globals.directoryUp:
            pointer = self.parent
            
        default:
            pointer = hasNode(name: token)
        }
        
        let next = pathTokens.dropFirst().joined()
        return pointer?.getNode(by: next, isInitial: false)
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
