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
        FSSHSIMULATION V.0.
        FILE SYSTEM AND SHELL SIMULATION IN SWIFT. MIT LICENSE.
        BY YAROSLAV SEDYSHEV <JAREKSEDY@ICLOUD.COM>
        GITHUB.COM/JAREKSEDY
        
        cat ~/available_commands
        
        FOR THE LIST OF AVAILABLE COMMANDS. HAVE FUN!
        
        """
            .toData()
    }
    
    static var availableCommands: Data {
        """
        FSSHSIMULATION V.0. AVAILABLE COMMANDS:
        
        cat file_name ...           - concatenate and print contents of a file(s) to standard output.
        cd directory_name           - change working directory to directory_name.
        chdir directory_name        - same as cd.
        echo argument > [file_name] - print argument to standard output or file.
        exit                        - exit shell.
        find path                   - recursively list contents of path.
        ls path                     - list contents of a directory.
        mkdir directory_name        - create a directory.
        pwd                         - print working directory path to standard output.
        rm file_name ...            - remove (delete) a file.
        rmdir directory_name ...    - remove an empty directory.
        touch file_name ...         - create an empty file.
        wget url > [file_name]      - get contents of a url and print it to standard output or a file.
        
        """
            .toData()
    }
    
    func toString() -> String {
        String(decoding: self, as: UTF8.self)
    }
}
