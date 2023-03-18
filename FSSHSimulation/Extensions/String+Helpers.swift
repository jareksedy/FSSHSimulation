//
//  String+Helpers.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

extension String {    
    func condenseWhitespace() -> String {
        let components = components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func strip() -> String {
        trimmingCharacters(in: .whitespaces).condenseWhitespace()
    }
    
    func toCommand() -> String? {
        components(separatedBy: " ").first?.lowercased()
    }
    
    func toArguments() -> [String] {
        Array(components(separatedBy: " ").dropFirst())
    }
    
    func tokenize() -> [String] {
        components(separatedBy: "/").enumerated().filter { index, element in index == 0 || !element.isEmpty }.map { $0.element }
    }
    
    func stripPath() -> String? {
        tokenize().last
    }
    
    func stripFilename() -> String? {
        tokenize().dropLast().joined(separator: .slash)
    }
    
    func isPath() -> Bool {
        let pathCharacters: [String] = [.slash, .dot, .doubleDot, .tilde]
        return !pathCharacters.filter { self.contains($0) }.isEmpty
    }
    
    func toClass() -> CommandProtocol.Type? {
        guard let moduleName = String(reflecting: Environment.self).split(separator: ".").first else { return nil }
        return Bundle.main.classNamed("\(moduleName).\(capitalized)") as? CommandProtocol.Type
    }
    
    func format(_ args: CVarArg...) -> String {
        String(format: self, arguments: args)
    }
    
    func isValid() -> Bool {
        let otherCharacters = CharacterSet(charactersIn: .dot + .underscore)
        return rangeOfCharacter(from: .alphanumerics.union(otherCharacters).inverted) == nil
    }
}
