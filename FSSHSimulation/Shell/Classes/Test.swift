//
//  Test.swift
//  FSSHSimulation
//
//  Created by Ярослав on 19.03.2023.
//

final class Test: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageDirectoryName
        }
        
        guard arguments.count == 1 else {
            throw Errors.tooManyArguments
        }
        
        let argument = arguments.first
        
        //print("TOKN :", argument?.tokenize())
        print("NAME :", argument!.stripPath())
        print("PATH :", argument!.stripFilename())
    }
}
