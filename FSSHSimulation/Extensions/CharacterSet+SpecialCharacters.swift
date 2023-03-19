//
//  CharacterSet+SpecialCharacters.swift
//  FSSHSimulation
//
//  Created by Ярослав on 19.03.2023.
//

import Foundation

extension CharacterSet {
    static var whitespace: CharacterSet {
        var characterSet = CharacterSet()
        characterSet.insert(charactersIn: .whitespace)
        return characterSet
    }
    
    static var slash: CharacterSet {
        var characterSet = CharacterSet()
        characterSet.insert(charactersIn: .slash)
        return characterSet
    }
}
