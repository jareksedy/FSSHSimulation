//
//  Session.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 12.03.2023.
//

class Session {
    let rootDirectory = RootDirectory()
    var isRunning = true
    
    static let shared = Session()
    private init() {}
}
