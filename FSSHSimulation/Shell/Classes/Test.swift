//
//  Test.swift
//  FSSHSimulation
//
//  Created by Ярослав on 19.03.2023.
//

final class Test: CommandProtocol {
    func main(arguments: [String]) throws {
        throw Errors.tooManyArguments
    }
}
