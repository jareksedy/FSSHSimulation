//
//  Environment.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Environment {
    let rootDirectory = Directory(name: "")
    
    let userName = "root"
    let hostName = "localhost"
    
    var currentDirectory: Directory
    var isRunning = true
    
    var prompt: String {
        .promptTemplate.format(userName, hostName, currentDirectory.name == .empty ? .slash : currentDirectory.name, .dollarSign)
    }
    
    static let shared = Environment()
    
    private init() {
        let homeDirectory = Directory(name: "home")
        let userDirectory = Directory(name: "root")

        homeDirectory.add(node: userDirectory)
        rootDirectory.add(node: homeDirectory)
        
        self.currentDirectory = userDirectory
    }
}
