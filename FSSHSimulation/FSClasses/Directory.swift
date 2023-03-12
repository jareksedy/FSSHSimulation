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
    
    func getNode(by fileName: String) -> AbstractFile? {
        return files.first(where: { $0.name == fileName })
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
