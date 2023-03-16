//
//  Find.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Find: CommandProtocol {
    func run(arguments: [String]) {
        find(node: currentDirectory)
    }
    
    private func find(node: Directory?) {
        print(node?.path ?? .empty)
        node?.nodes.forEach { node in
            find(node: node as? Directory)
        }
    }
}
