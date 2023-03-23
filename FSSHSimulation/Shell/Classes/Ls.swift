//
//  Ls.swift
//  FSSHSimulation
//
//  Created by Ярослав on 23.03.2023.
//

fileprivate enum Strings {
    static let file: String = "f"
    static let directory: String = "d"
}

final class Ls: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            do { try listDirectory(atPath: ".") }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
            return
        }
        
        arguments.enumerated().forEach { (index, path) in
            do { try listDirectory(atPath: path) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
            
            if arguments.count > 1 && index != arguments.count - 1 { print() }
        }
    }
    
    private func listDirectory(atPath path: String) throws {
        guard let node = environment.currentDirectory.getNode(atPath: path) else {
            throw Errors.nodeNotFound(name: path)
        }
        
        switch node {
        case is FileProtocol: print(node.path)
        case is DirectoryProtocol: listDirectory(node: (node as? DirectoryProtocol))
        default: break
        }
    }
    
    private func listDirectory(node: DirectoryProtocol?) {
        guard let node = node else { return }
        
        print("\(Strings.directory) \(String.dot)")
        if node !== environment.rootDirectory { print("\(Strings.directory) \(String.doubleDot)") }
        
        node.nodes.forEach { node in
            let sign = node is FileProtocol ? Strings.file : Strings.directory
            print("\(sign) \(node.name)")
        }
    }
}
