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
}
