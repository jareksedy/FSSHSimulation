//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let directory3 = Directory(name: "Homework")
let directory2 = Directory(name: "Desktop")
let directory1 = Directory(name: "Downloads")
let directory4 = Directory(name: "Documents")
let rootDirectory = RootDirectory()

rootDirectory.add(files: [directory2, directory4, directory1])
directory2.add(file: directory3)
rootDirectory.list()

print()

directory2.remove(file: directory3)
rootDirectory.list()
