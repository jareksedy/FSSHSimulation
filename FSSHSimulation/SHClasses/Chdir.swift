//
//  Chdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

fileprivate enum Messages {
    static let notFound = "no such file or directory:"
}

class Chdir: AbstractCommand {
    override func run(arguments: [String]) {
        guard let directoryName = arguments.first, let currentDirectory = environment.currentDirectory as? Directory else { return }
        currentDirectory.files.forEach { file in
            if file.name == directoryName {
                environment.currentDirectory = file
            }
        }
    }
}
