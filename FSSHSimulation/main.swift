//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let environment = Environment.shared

while environment.isRunning {
    print(environment.prompt, terminator: " ")
    
    if let input = readLine()?.strip(), let command = input.toCommand(), !command.isEmpty {
        if let instance = command.toClass()?.init() {
            instance.main(arguments: input.toArguments())
        } else {
            print(Messages.commandNotFound.format(command))
        }
    }
}
