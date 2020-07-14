//
//  main.swift
//  TestService
//
//  Created by Johannes Bittner on 14.07.20.
//  Copyright © 2020 Johannes Bittner. All rights reserved.
//

import Foundation
import Network


let port = NWEndpoint.Port(integerLiteral: 31337)
let listener = try! NWListener(using: .tcp, on: port)

listener.newConnectionHandler = { nwConnection in
    nwConnection.start(queue: .main)
    
    nwConnection.send(
        content: "foobar".data(using: .utf8),
        completion: .contentProcessed({ error in
            if let error = error {
                fatalError("error in nwConnection.send: \(error)")
            }
            nwConnection.cancel()
        }))
}

listener.start(queue: .main)
dispatchMain()

