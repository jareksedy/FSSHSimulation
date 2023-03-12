//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let environment = Environment.shared

while environment.isRunning {
    print("[ \(environment.currentDirectory.path) ]", environment.prompt, terminator: " ")
    
    if let input = readLine()?.strip(), let command = input.toCommand(), !command.isEmpty {
        if let commandInstance = command.toClass()?.init() {
            commandInstance.run(arguments: input.toArguments())
        } else {
            print("\(Strings.notFound) \(command)")
        }
    }
}
