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
        return components.filter { !$0.isEmpty }.joined(separator: .whitespace)
    }
    
    func strip() -> String {
        trimmingCharacters(in: .whitespaces).condenseWhitespace()
    }
    
    func toCommandName() -> String? {
        components(separatedBy: .whitespace).first?.lowercased()
    }
    
    func toArguments() -> [String] {
        Array(components(separatedBy: .whitespace).dropFirst())
    }
    
    func tokenize() -> [String] {
        components(separatedBy: .slash).enumerated().filter { index, element in index == 0 || !element.isEmpty }.map { $0.element }
    }
    
    func stripPath() -> String {
        tokenize().last ?? .empty
    }
    
    func stripFilename() -> String {
        tokenize().map { $0 == .empty ? .slash : $0 }.dropLast().joined(separator: .slash).replacingOccurrences(of: Self.doubleSlash, with: Self.slash)
    }
    
    func toClass() -> CommandProtocol.Type? {
        guard let moduleName = String(reflecting: Environment.self).split(separator: ".").first else { return nil }
        return Bundle.main.classNamed("\(moduleName).\(capitalized)") as? CommandProtocol.Type
    }
    
    func format(_ args: CVarArg...) -> String {
        String(format: self, arguments: args)
    }
    
    func isValid() -> Bool {
        guard self != .empty else { return false }
        let otherCharacters = CharacterSet(charactersIn: .dot + .underscore)
        return rangeOfCharacter(from: .alphanumerics.union(otherCharacters).inverted) == nil
    }
    
    func toData() -> Data {
        Data(self.utf8)
    }
}
