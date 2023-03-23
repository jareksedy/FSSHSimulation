//
//  Data+Helpers.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 22.03.2023.
//

import Foundation

extension Data {
    static var motd: Data {
        """
        Filesystem and Unix Shell Simulation.
        FSSHSimulation v.0. by Yaroslav Sedyshev <jareksedy@icloud.com>
        """
            .toData()
    }
    
    static var availableCommands: Data {
        """
        List of available commands.
        
        find directory_name
        ls directory_name
        mkdir directory_name
        chdir directory_name
        """
            .toData()
    }
    
    func toString() -> String {
        String(decoding: self, as: UTF8.self)
    }
}
