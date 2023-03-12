//
//  AbstractCommand.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

class AbstractCommand {
    let environment = Environment.shared
    let currentDirectory = Environment.shared.currentDirectory as! Directory
    
    var commandName: String {
        return String(describing: self).components(separatedBy: ".").last?.lowercased() ?? ""
    }
    
    required init() {}
    
    func run(arguments: [String]) {
        fatalError("Implement this method in child class.")
    }
}
