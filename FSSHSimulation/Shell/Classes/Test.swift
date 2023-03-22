//
//  Test.swift
//  FSSHSimulation
//
//  Created by Ярослав on 19.03.2023.
//

import Foundation

final class Test: CommandProtocol {
    var contents: Data? = nil
    func main(arguments: [String]) throws {
        if let data = "Превед, медвед!".data(using: .utf8) {
            contents = data
        }
        print(contents!.mimeType)
    }
}
