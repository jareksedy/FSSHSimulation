//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

let session = Session.shared

while session.isRunning {
    print(Globals.prompt, terminator: Globals.terminator)
    
    if let input = readLine()?.trimmingCharacters(in: .whitespaces).condenseWhitespace(),
       let command = input.split(separator: " ").first {
        
        switch command.lowercased() {
        case "exit":
            session.isRunning = false
            
        default:
            let className = String(command.capitalized)
            if let theClass = NSClassFromString("FSSHSimulation." + className) as? AbstractCommand.Type {
                let object = theClass.init(parent: session.rootDirectory)
                object.run(arguments: ["test", "vvv"])
            } else {
                print("\(Strings.notFound) \(command)")
            }
        }
    }
}
