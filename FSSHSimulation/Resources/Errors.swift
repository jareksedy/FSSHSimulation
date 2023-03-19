//
//  Errors.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 19.03.2023.
//

enum Errors: Error {
    case nodeExists(name: String)
    case nodeNotFound
    case nodeNotEmpty(name: String)
    case invalidFileName(name: String)
    
    case tooManyArguments
    case usageDirectoryName
    
    case commandNotFound
    
    var localizedDescription: String {
        return "Unknown error..."
    }
    
    func localizedDescription(commandName: String) -> String {
        switch self {
        case .nodeExists(let name):
            return "%@: file exists: %@".format(commandName, name)
        case .nodeNotFound:
            return "%@: no such file or directory".format(commandName)
        case .nodeNotEmpty(name: let name):
            return "%@: directory not empty: %@".format(commandName, name)
        case .tooManyArguments:
            return "%@: too many arguments".format(commandName)
        case .usageDirectoryName:
            return "usage: %@: directory_name".format(commandName)
        case .invalidFileName(name: let name):
            return "%@: invalid file or directory name: %@".format(commandName, name)
        case .commandNotFound:
            return "command not found: %@".format(commandName)
        }
    }
}
