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
}
