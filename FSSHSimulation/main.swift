//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let environment = Environment.shared

func processInput(commandName: String, arguments: [String]) throws {
    guard let command = commandName.toClass()?.init() else {
        throw Errors.commandNotFound
    }
    
    do { try command.main(arguments: arguments) }
    catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
    catch let error { print(error.localizedDescription) }
}

while environment.isRunning {
    print(environment.prompt, terminator: .whitespace)
    
    if let input = readLine()?.strip(), let commandName = input.toCommandName(), !commandName.isEmpty {
        do { try processInput(commandName: commandName, arguments: input.toArguments()) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}

