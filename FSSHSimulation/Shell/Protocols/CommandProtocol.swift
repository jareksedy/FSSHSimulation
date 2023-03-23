//
//  CommandProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

protocol CommandProtocol {
    func main(arguments: [String]) throws
    init()
}

extension CommandProtocol {
    var environment: Environment {
        Environment.shared
    }
    
    var commandName: String {
        String(describing: self).components(separatedBy: ".").last?.lowercased() ?? .empty
    }
    
    func touchFile(atPath path: String) throws {
        let fileName = path.stripPath()
        let parentDirectoryName = path.stripFilename()
        
        guard let directory = environment.currentDirectory.getNode(atPath: parentDirectoryName) as? DirectoryProtocol else {
            throw Errors.nodeNotFound(name: path)
        }
        
        let file = File(name: fileName)
        
        do { try directory.add(node: file) }
        catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
        catch let error { print(error.localizedDescription) }
    }
}
