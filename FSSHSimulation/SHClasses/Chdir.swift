//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

fileprivate enum Messages {
    static let usage = "usage: %@: directory_name"
    static let notFound = "no such file or directory:"
}

final class Chdir: AbstractCommand {
    override func run(arguments: [String]) {
        guard let directoryName = arguments.first else {
            print(Messages.usage.format(commandName))
            return
        }
        
        currentDirectory?.files.forEach { file in
            if file.name == directoryName {
                environment.currentDirectory = file
            }
        }
    }
}
