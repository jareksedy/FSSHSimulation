//
//  StringProtocol+SpecialCharacters.swift
//  FSSHSimulation
//
//  Created by Ярослав on 21.03.2023.
//

extension StringProtocol {
    static var slash: any StringProtocol { String.slash }
    static var doubleSlash: any StringProtocol { String.slash + String.slash }
}
