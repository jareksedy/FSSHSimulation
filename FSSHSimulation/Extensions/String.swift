//
//  String+condenseWhitespace.swift
//  FSSHSimulation
//
//  Created by Ярослав on 11.03.2023.
//

import Foundation

extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func toCommandClass() -> AnyClass? {
        struct My { static let moduleName = String(reflecting: AbstractCommand.self).prefix { $0 != "." }}
        return NSClassFromString("\(My.moduleName).\(self)")
    }
}
