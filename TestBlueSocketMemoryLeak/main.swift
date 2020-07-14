//
//  main.swift
//  TestBlueSocketMemoryLeak
//
//  Created by Johannes Bittner on 14.07.20.
//  Copyright © 2020 Johannes Bittner. All rights reserved.
//

import Foundation
import Socket

var i = 0
while true {
    let socket = try Socket.create()
    try! socket.connect(to: "localhost", port: 31337)
    let serviceResponse = try! socket.readString()!

    i += 1
    print(i, String(describing: serviceResponse))
    Thread.sleep(forTimeInterval: 0.001)
}
