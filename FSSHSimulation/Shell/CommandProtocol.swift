//
//  CommandProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

protocol CommandProtocol {
    func run(arguments: [String])
    init()
}

extension CommandProtocol {
    var environment: Environment {
        return Environment.shared
    }
    
    var currentDirectory: Directory {
        return environment.currentDirectory
    }
    
    var commandName: String {
        return String(describing: self).components(separatedBy: ".").last?.lowercased() ?? .empty
    }
}
