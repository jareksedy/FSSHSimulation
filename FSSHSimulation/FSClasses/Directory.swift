//
//  Directory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class Directory: AbstractFile {
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
    
    func add(files: [AbstractFile]) {
        files.forEach { file in
            self.files.append(file)
            file.parent = self
        }
    }
    
    func add(file: AbstractFile) {
        add(files: [file])
    }
}
