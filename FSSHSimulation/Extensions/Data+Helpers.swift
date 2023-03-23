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
    
    func toString() -> String {
        String(decoding: self, as: UTF8.self)
    }
}
