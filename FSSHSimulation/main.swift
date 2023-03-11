//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let rootDirectory = RootDirectory()
var isRunning = true

while isRunning {
    print(Globals.prompt, terminator: Globals.whitespace)
    if let input = readLine()?.trimmingCharacters(in: .whitespaces).condenseWhitespace(),
       let command = input.split(separator: " ").first {
        switch command.lowercased() {
        case "exit":
            isRunning = false
        default:
            print("\(Strings.notFound) \(command)")
        }
    }
}
