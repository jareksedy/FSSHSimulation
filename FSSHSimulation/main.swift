//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let environment = Environment.shared

while environment.isRunning {
    print(environment.prompt, terminator: " ")
    
    if let input = readLine()?.strip(), let commandName = input.toCommand(), !commandName.isEmpty {
        if let command = commandName.toClass()?.init() {
            command.main(arguments: input.toArguments())
        } else {
            print(Messages.commandNotFound.format(commandName))
        }
    }
}
