//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let environment = Environment.shared

while environment.isRunning {
    let prompt = "[\(environment.userName)@\(environment.hostName) \(environment.currentDirectory.directoryName)] \(environment.promptChar)"
    print(prompt, terminator: " ")
    
    if let input = readLine()?.strip(), let command = input.toCommand(), !command.isEmpty {
        if let commandInstance = command.toClass()?.init() {
            commandInstance.run(arguments: input.toArguments())
        } else {
            print(Strings.Messages.commandNotFound.format(command))
        }
    }
}
