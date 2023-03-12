//
//  Environment.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Environment {
    let rootDirectory = RootDirectory()
    let currentDirectory: AbstractFile
    let prompt = "$"
    
    var isRunning = true
    
    static let shared = Environment()
    
    private init() {
        self.currentDirectory = rootDirectory
    }
}
