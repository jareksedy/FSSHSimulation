//
//  Echo.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 23.03.2023.
//

final class Echo: CommandProtocol {
    func main(arguments: [String]) throws {
        guard !arguments.isEmpty else {
            throw Errors.usageArgument
        }
        
        var text: String? = arguments.joined(separator: .whitespace)
        var fileName: String? = nil
        
        if let index = arguments.firstIndex(of: .greaterThan) {
            text = arguments.prefix(index).joined(separator: .whitespace)
            fileName = arguments.last
        }
        
        guard let fileName = fileName else {
            print(text ?? .empty)
            return
        }
        
        if environment.currentDirectory.getNode(atPath: fileName) == nil {
            do { try touchFile(atPath: fileName) }
            catch let error as Errors { print(error.localizedDescription(commandName: commandName)) }
            catch let error { print(error.localizedDescription) }
        }
        
        guard let file = environment.currentDirectory.getNode(atPath: fileName) as? FileProtocol,
              let text = text else { return }
        
        file.write(text.toData())
    }
}
