//
//  Environment.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Environment {
    let rootDirectory = Directory(name: "")
    
    let promptChar = "$"
    let userName = "root"
    let hostName = "localhost"
    
    var currentDirectory: Directory
    var isRunning = true
    
    static let shared = Environment()
    
    private init() {
        let homeDirectory = Directory(name: "home")
        let userDirectory = Directory(name: "root")

        homeDirectory.add(node: userDirectory)
        rootDirectory.add(node: homeDirectory)
        
        self.currentDirectory = userDirectory
    }
}
