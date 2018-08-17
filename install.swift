//
//  Clean Module Template
//
//  Created by Maxim Pisarenko on 14/11/2017.
//  Copyright © 2017 MAG Development. All rights reserved.
//

import Foundation

let templateName = "Clean Module.xctemplate"
let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

func moveTemplate() {

    let fileManager = FileManager.default
    let templatesDirPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    do {
        let destinationPath = "\(templatesDirPath)/\(templateName)"
        if !fileManager.fileExists(atPath: destinationPath) {
            try fileManager.copyItem(atPath: templateName, toPath: destinationPath)
            print("✅  Template installed succesfully 🎉. Enjoy it 🙂")

        } else {
            try fileManager.removeItem(atPath: destinationPath)
            try fileManager.copyItem(atPath: templateName, toPath: destinationPath)
            print("✅  Template already exists. So has been replaced succesfully 🎉. Enjoy it 🙂")
        }
    } catch let error as NSError {
        print("❌  Ooops! Something went wrong 😡: \(error.localizedFailureReason!)")
    }
}

func shell(launchPath: String, arguments: [String]) -> String {
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }

    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()
