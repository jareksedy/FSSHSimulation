//
//  Folder.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class Folder: AbstractFile {
    private(set) var files: [AbstractFile]
    
    init(parent: AbstractFile? = nil, name: String, files: [AbstractFile] = []) {
        self.files = files
        super.init(parent: parent, name: name)
        
        files.forEach { file in
            file.parent = self
        }
    }
    
    override func list(withPath: Bool = true) {
        withPath ? print(path) : print(name)
        
        files.forEach { file in
            file.list(withPath: withPath)
        }
    }
    
    func add(files: AbstractFile...) {
        self.files.append(contentsOf: files)
    }
    
    func remove(file: AbstractFile) {
        files.removeAll(where: { $0 === file })
    }
}
