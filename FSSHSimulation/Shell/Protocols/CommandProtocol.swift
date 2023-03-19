//
//  CommandProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

protocol CommandProtocol {
    func main(arguments: [String]) throws
    init()
}

extension CommandProtocol {
    var environment: Environment {
        Environment.shared
    }
    
    var commandName: String {
        String(describing: self).components(separatedBy: ".").last?.lowercased() ?? .empty
    }
}
