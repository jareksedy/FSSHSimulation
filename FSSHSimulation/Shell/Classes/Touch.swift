//
//  Touch.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 22.03.2023.
//

final class Touch: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageFiles
        }
        
        arguments.forEach { path in
            do { try touchFile(atPath: path) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
    }
}
