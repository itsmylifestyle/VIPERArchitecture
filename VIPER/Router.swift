//
//  Router.swift
//  VIPER
//
//  Created by Айбек on 08.12.2023.
//

import Foundation

//Orchestrates whole thing

//Entrypoint


protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
    
    
}
