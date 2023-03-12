//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

fileprivate enum Messages {
    static let usage = "usage: mkdir directory_name"
    static let notFound = "no such file or directory:"
}

class Mkdir: AbstractCommand {
    override func run(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(Messages.usage)
            return
        }
        
        arguments.forEach { argument in
            let directory = Directory(name: argument)
            (environment.currentDirectory as? Directory)?.add(file: directory)
        }
    }
}
