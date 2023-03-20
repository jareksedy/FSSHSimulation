//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Chdir: CommandProtocol {
    func main(arguments: [String]) throws {
        guard let path = arguments.first else {
            throw Errors.usageDirectoryName
        }
        
        guard arguments.count == 1 else {
            throw Errors.tooManyArguments
        }
        
        guard let directory = environment.currentDirectory.getNode(atPath: path) as? Directory else {
            throw Errors.nodeNotFound(name: path)
        }
        
        environment.currentDirectory = directory
    }
    
    required init() {}
}
