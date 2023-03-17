//
//  String+SpecialCharacters.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 16.03.2023.
//

extension String {
    static var empty: String { "" }
    static var whitespace: String { " " }
    static var slash: String { "/" }
    static var dot: String { "." }
    static var doubleDot: String { ".." }
    static var tilde: String { "~" }
    static var homeDirectory: String { "/home/root" }
    static var promptTemplate: String { "[%@@%@ %@] %@" }
}
