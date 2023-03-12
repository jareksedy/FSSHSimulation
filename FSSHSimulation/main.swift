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
        
        if let commandInstance = command.toClass()?.init(parent: environment.rootDirectory) {
            commandInstance.run(arguments: arguments)
        } else {
            print("\(Strings.notFound) \(command)")
        }
    }
}
