//
//  Data+Mimetype.swift
//  FSSHSimulation
//
//  Created by Ярослав on 22.03.2023.
//

import Foundation

extension Data {
    var mimeType: DocumentType {
        var firstByte: UInt8 = 0
        copyBytes(to: &firstByte, count: 1)
        
        switch firstByte {
        case 0xFF: return .jpeg
        case 0x89: return .png
        case 0x47: return .gif
        case 0x25: return .pdf
        case 0xD0: return .vnd
        case 0x46: return .plainText
        default: return .anyBinary
        }
    }
}
