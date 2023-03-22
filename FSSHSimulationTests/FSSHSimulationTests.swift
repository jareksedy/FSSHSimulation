//
//  FSSHSimulationTests.swift
//  FSSHSimulationTests
//
//  Created by Yaroslav Sedyshev on 18.03.2023.
//

import XCTest

final class FSSHSimulationTests: XCTestCase {
    let environment = Environment.shared

    func testChdir() throws {
        let chdirCommand = Chdir()
        try? chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/home")
        try? chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/")
        try? chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/")
        try? chdirCommand.main(arguments: ["~/.."])
        XCTAssert(environment.currentDirectory.path == "/home")
        try? chdirCommand.main(arguments: ["/.."])
        XCTAssert(environment.currentDirectory.path == "/")
        try? chdirCommand.main(arguments: ["/home/root"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        try? chdirCommand.main(arguments: ["~/../~/.."])
        XCTAssert(environment.currentDirectory.path == "/home")
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
    }
    
    func testMkdirChdir() throws {
        let mkdirCommand = Mkdir()
        let chdirCommand = Chdir()
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        for i in 0 ... 9_999 {
            try? mkdirCommand.main(arguments: ["test\(i)"])
            try? chdirCommand.main(arguments: ["test\(i)"])
            XCTAssert(environment.currentDirectory.name == "test\(i)")
        }
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        try? mkdirCommand.main(arguments: ["/home/root/test0/test1/test2/test3/test4/test5/test6/test7/test8/hello"])
        try? chdirCommand.main(arguments: ["/home/root/test0/test1/test2/test3/test4/test5/test6/test7/test8/hello"])
        XCTAssert(environment.currentDirectory.name == "hello")
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        try? mkdirCommand.main(arguments: ["/usr"])
        try? mkdirCommand.main(arguments: ["../../usr/bin"])
        try? chdirCommand.main(arguments: ["/usr/bin"])
        XCTAssert(environment.currentDirectory.name == "bin")
        
        try? chdirCommand.main(arguments: ["/"])
        XCTAssert(environment.currentDirectory.path == "/")
        
        for i in 0 ... 9_999 {
            try? mkdirCommand.main(arguments: ["temp_directory\(i)"])
        }

        XCTAssert(environment.rootDirectory.nodes.count == 10_003)
    }
    
    func testRmdir() throws {
        let mkdirCommand = Mkdir()
        let chdirCommand = Chdir()
        let rmdirCommand = Rmdir()
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        try? mkdirCommand.main(arguments: ["/temp"])
        try? rmdirCommand.main(arguments: ["/temp"])
        
        try? mkdirCommand.main(arguments: ["~/temp"])
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        try? rmdirCommand.main(arguments: ["temp"])
        
        try? chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
    }
}
