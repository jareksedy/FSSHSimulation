//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

final class Mkdir: CommandProtocol {
    func run(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(Strings.Messages.usageDirectoryName.format(commandName))
            return
        }
        
        arguments.forEach { argument in
            let directory = Directory(name: argument)
            environment.currentDirectory.add(node: directory)
        }
    }
}
