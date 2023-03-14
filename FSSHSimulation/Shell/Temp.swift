//
//  Temp.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 13.03.2023.
//

final class Temp: CommandProtocol {
    func run(arguments: [String]) {
        print(arguments.first?.tokenize() ?? "")
    }
}
