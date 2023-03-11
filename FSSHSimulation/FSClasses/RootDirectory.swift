//
//  RootDirectory.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class RootDirectory: Directory {
    init(files: [AbstractFile] = []) {
        super.init(name: "", files: files)
    }
}
