//
//  Pwd.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Pwd: CommandProtocol {
    func main(arguments: [String]) throws {
        guard arguments.isEmpty else {
            throw Errors.tooManyArguments
        }
        
        print(environment.currentDirectory.path)
    }
}
