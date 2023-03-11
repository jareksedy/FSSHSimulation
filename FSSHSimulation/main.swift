//
//  main.swift
//  FSSHSimulation
//
//  Created by Yaroslav Sedyshev on 11.03.2023.
//

let folder3 = Folder(name: "Homework")
let folder2 = Folder(name: "Desktop", files: [folder3])
let folder1 = Folder(name: "Downloads")
let folder4 = Folder(name: "Documents")
let rootFolder = RootFolder(files:  [folder2, folder1, folder4])

rootFolder.list()
