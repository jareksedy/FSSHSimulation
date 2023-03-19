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
        chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/home")
        chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/")
        chdirCommand.main(arguments: [".."])
        XCTAssert(environment.currentDirectory.path == "/")
        chdirCommand.main(arguments: ["~/.."])
        XCTAssert(environment.currentDirectory.path == "/home")
        chdirCommand.main(arguments: ["/.."])
        XCTAssert(environment.currentDirectory.path == "/")
        chdirCommand.main(arguments: ["/home/root"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        chdirCommand.main(arguments: ["~/../~/.."])
        XCTAssert(environment.currentDirectory.path == "/home")
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
    }
    
    func testMkdirChdir() throws {
        let mkdirCommand = Mkdir()
        let chdirCommand = Chdir()
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        for i in 0 ... 9_999 {
            mkdirCommand.main(arguments: ["test\(i)"])
            chdirCommand.main(arguments: ["test\(i)"])
            XCTAssert(environment.currentDirectory.name == "test\(i)")
        }
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        mkdirCommand.main(arguments: ["/home/root/test0/test1/test2/test3/test4/test5/test6/test7/test8/hello"])
        chdirCommand.main(arguments: ["/home/root/test0/test1/test2/test3/test4/test5/test6/test7/test8/hello"])
        XCTAssert(environment.currentDirectory.name == "hello")
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        mkdirCommand.main(arguments: ["/usr"])
        mkdirCommand.main(arguments: ["../../usr/bin"])
        chdirCommand.main(arguments: ["/usr/bin"])
        XCTAssert(environment.currentDirectory.name == "bin")
        
        chdirCommand.main(arguments: ["/"])
        XCTAssert(environment.currentDirectory.path == "/")
        
        for i in 0 ... 9_999 {
            mkdirCommand.main(arguments: ["temp_directory\(i)"])
        }
        
        XCTAssert(environment.rootDirectory.nodes.count == 10_002)
    }
    
    func testRmdir() throws {
        let mkdirCommand = Mkdir()
        let chdirCommand = Chdir()
        let rmdirCommand = Rmdir()
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        mkdirCommand.main(arguments: ["/temp"])
        rmdirCommand.main(arguments: ["/temp"])
        
        mkdirCommand.main(arguments: ["~/temp"])
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
        
        rmdirCommand.main(arguments: ["temp"])
        
        chdirCommand.main(arguments: ["~"])
        XCTAssert(environment.currentDirectory.path == "/home/root")
    }
}
