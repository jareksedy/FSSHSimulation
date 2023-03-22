//
//  DocumentType.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 22.03.2023.
//

enum DocumentType: String {
    case plainText = "text/plain"
    case jpeg = "image/jpeg"
    case png = "image/png"
    case gif = "image/gif"
    case pdf = "application/pdf"
    case vnd = "application/vnd"
    case anyBinary = "application/octet-stream"
}
