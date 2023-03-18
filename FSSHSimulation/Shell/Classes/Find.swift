//
//  Find.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

final class Find: CommandProtocol {
    func main(arguments: [String]) {
        guard !arguments.isEmpty else {
            find(node: environment.rootDirectory)
            return
        }
        
        arguments.forEach { path in
            if let node = environment.currentDirectory.getNode(by: path) {
                find(node: node as? DirectoryProtocol)
            } else {
                print(Messages.noSuchFileOrDirectory.format(commandName, path))
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
