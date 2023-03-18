//
//  Messages.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

enum Messages {
    static let commandNotFound = "command not found: %@"
    static let tooManyArguments = "%@: too many arguments"
    static let usageDirectoryName = "usage: %@: directory_name"
    static let noSuchFileOrDirectory = "%@: no such file or directory: %@"
    static let fileExists = "%@: file exists: %@"
    static let invalidName = "%@: invalid file or directory name: %@"
}
