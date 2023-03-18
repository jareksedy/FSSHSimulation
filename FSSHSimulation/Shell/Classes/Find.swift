//
//  Find.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Find: CommandProtocol {
    func main(arguments: [String]) {
        arguments.forEach { argument in
            if let node = environment.currentDirectory.getNode(by: argument) {
                find(node: node as? DirectoryProtocol)
            }
        }
    }
    
    private func find(node: DirectoryProtocol?) {
        print(node?.path ?? .empty)
        
        node?.nodes.forEach { node in
            find(node: node as? DirectoryProtocol)
        }
    }
}
