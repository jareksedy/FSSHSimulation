//
//  Mkdir.swift
//  FSSHSimulation
//
//  Created by Ярослав on 12.03.2023.
//

class Mkdir: AbstractCommand {
    let usageInfo = "usage: mkdir directory_name ..."
    
    override func run(arguments: [String]) {
        guard !arguments.isEmpty else {
            print(usageInfo)
            return
        }
        
        arguments.forEach { argument in
            let directory = Directory(name: argument)
            environment.rootDirectory.add(file: directory)
        }
    }
}
