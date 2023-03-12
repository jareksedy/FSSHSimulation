//
//  Environment.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Environment {
    let rootDirectory = RootDirectory()
    let promptChar = "$"
    let userName = "root"
    let hostName = "localhost"
    
    var currentDirectory: AbstractFile
    var isRunning = true
    
    static let shared = Environment()
    
    private init() {
        let homeDirectory = Directory(name: "home")
        let userDirectory = Directory(name: "root")
        
        homeDirectory.add(file: userDirectory)
        rootDirectory.add(file: homeDirectory)
        
        self.currentDirectory = userDirectory
    }
}
