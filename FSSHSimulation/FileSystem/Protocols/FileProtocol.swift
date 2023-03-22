//
//  FileProtocol.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 21.03.2023.
//

import Foundation

protocol FileProtocol: Node {
    var contents: Data? { get }
    
    func write(_ data: Data)
    func read() -> Data?
}
