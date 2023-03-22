//
//  Environment.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Environment {
    let rootDirectory = Directory(name: .empty)
    
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
        let etcDirectory = Directory(name: "etc")
        let motdFile = File(name: "motd")

        try? homeDirectory.add(node: userDirectory)
        try? rootDirectory.add(node: homeDirectory)
        try? rootDirectory.add(node: etcDirectory)
        try? etcDirectory.add(node: motdFile)
        
        self.currentDirectory = userDirectory
    }
}
