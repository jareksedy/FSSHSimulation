//
//  String+condenseWhitespace.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

extension String {
    static var empty: String { return "" }
    static var slash: String { return "/" }
    static var dot: String { return "." }
    static var doubleDot: String { return ".." }
    static var tilde: String { return "~" }
    
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
    
    func tokenize() -> [String] {
        return self.components(separatedBy: "/").enumerated().filter { index, element in index == 0 || !element.isEmpty }.map { $0.element }
    }
    
    func toClass() -> AbstractCommand.Type? {
        guard let moduleName = String(reflecting: Environment.self).split(separator: ".").first else { return nil }
        return Bundle.main.classNamed("\(moduleName).\(self.capitalized)") as? AbstractCommand.Type
    }
    
    func format(_ args: CVarArg...) -> String {
        return String(format: self, arguments: args)
    }
}
