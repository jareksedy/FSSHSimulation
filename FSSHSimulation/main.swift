//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

let environment = Environment.shared

while environment.isRunning {
    print(environment.prompt, terminator: " ")
    
    if let input = readLine()?.strip(), let command = input.toCommand(), command != "" {
        let arguments = input.toArguments()
        
        if let commandClass = command.toClass() {
            let instance = commandClass.init(parent: environment.rootDirectory)
            instance.run(arguments: arguments)
        } else {
            print("\(Strings.notFound) \(command)")
        }
    }
}
