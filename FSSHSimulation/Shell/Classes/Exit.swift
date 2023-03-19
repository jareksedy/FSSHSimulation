//
//  Exit.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Exit: CommandProtocol {
    func main(arguments: [String]) throws {
        guard arguments.isEmpty else {
            throw Errors.tooManyArguments
        }
        
        environment.isRunning = false
    }
}
