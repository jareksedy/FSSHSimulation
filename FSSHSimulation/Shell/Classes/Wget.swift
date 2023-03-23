//
//  Wget.swift
//  FSSHSimulation
//
//  Created by Ярослав on 23.03.2023.
//

import Foundation

final class Wget: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageURL
        }
        
        var url: String? = arguments.joined(separator: .whitespace)
        var fileName: String? = nil
        //var contents: Data? = nil
        
        if let index = arguments.firstIndex(of: .greaterThan) {
            url = arguments.prefix(index).joined(separator: .whitespace)
            fileName = arguments.last
        }
        
        guard let fileName = fileName else {
            throw Errors.nodeNotFound(name: .empty)
        }
        
        guard let url = URL(string: url ?? .empty) else {
            throw Errors.invalidURL(name: url ?? .empty)
        }
        
        if environment.currentDirectory.getNode(atPath: fileName) == nil {
            do { try touchFile(atPath: fileName) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
        
        guard let file = environment.currentDirectory.getNode(atPath: fileName) as? FileProtocol else {
            print(getContents(url: url)?.toString() ?? .empty)
            return
        }

        file.write(getContents(url: url))
    }
    
    private func getContents(url: URL) -> Data? {
        print("Getting contents of: \(url.absoluteString)")
        do { return try Data(contentsOf: url) }
        catch let error { print(error.localizedDescription) }
        return nil
    }
}
