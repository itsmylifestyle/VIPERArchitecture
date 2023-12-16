//
//  Router.swift
//  VIPER
//
//  Created by Айбек on 08.12.2023.
//

import Foundation
import UIKit

//Orchestrates whole thing

//Entrypoint

typealias EntryPoint = AnyView & UIViewController


protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewContoller()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = cryptoInteractor()
        
        view.presenter = presenter
        presenter.View = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
