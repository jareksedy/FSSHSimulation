//
//  String+condenseWhitespace.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

import Foundation

extension String {
    static var empty: String { "" }
    static var whitespace: String { " " }
    static var slash: String { "/" }
    static var dot: String { "." }
    static var doubleDot: String { ".." }
    static var tilde: String { "~" }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func strip() -> String {
        return self.trimmingCharacters(in: .whitespaces).condenseWhitespace().filterAllowedCharacters()
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
    
    func filterAllowedCharacters() -> String {
        let alphanumerics = CharacterSet.alphanumerics
        let other = CharacterSet(charactersIn: .empty + .whitespace + .slash + .dot + .doubleDot + .tilde)
        let allowedCharacterSet = alphanumerics.union(other)
        return String(self.unicodeScalars.filter { allowedCharacterSet.contains($0) })
    }
}
