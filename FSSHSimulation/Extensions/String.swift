//
//  String+condenseWhitespace.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func strip() -> String {
        return self.trimmingCharacters(in: .whitespaces).condenseWhitespace()
    }
    
    func toCommand() -> String? {
        return self.components(separatedBy: " ").first?.lowercased()
    }
    
    func toArguments() -> [String] {
        return Array(self.components(separatedBy: " ").dropFirst())
    }
    
    func toPath() -> [String] {
        return Array(self.components(separatedBy: Globals.pathSeparator).dropFirst())
    }
    
    func toClass() -> AbstractCommand.Type? {
        guard let moduleName = String(reflecting: Environment.self).split(separator: ".").first else { return nil }
        return Bundle.main.classNamed("\(moduleName).\(self.capitalized)") as? AbstractCommand.Type
    }
    
    func format(_ args: CVarArg...) -> String {
        return String(format: self, arguments: args)
    }
    
    func isPath() -> Bool {
        return self.contains(Globals.pathSeparator)
    }
}
