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
        var pointer: AbstractFile? = self
        
        guard !path.isEmpty else { return pointer }
        
        let pathTokens = path.tokenize()
        
        guard let token = pathTokens.first else { return nil }
        
        switch token {
        case Globals.pathSeparator:
            pointer = Environment.shared.rootDirectory
        case Globals.levelUp:
            pointer = self.parent
        default:
            pointer = self.hasNode(name: token)
        }
        
        return pointer?.getNode(by: pathTokens.dropFirst().joined())
    }
    
//    func getNode(by path: String) -> AbstractFile? {
//        var pointer: AbstractFile? = self
//        let components = path.split(separator: "/").map(String.init)
//        guard !components.isEmpty else { return Environment.shared.rootDirectory }
//
//        for component in components {
//            if let directory = pointer as? Directory {
//                pointer = directory.hasNode(name: component)
//            } else {
//                return nil
//            }
//        }
//
//        return pointer
//    }
    
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
