//
//  Presenter.swift
//  VIPER
//
//  Created by Айбек on 08.12.2023.
//

import Foundation

//talks to -> interactor, router, view

protocol AnyPresenter {
    var router : AnyRouter? {
        get set
    }
    
    var interactor : AnyInteractor? {
        get set
    }
    
    var View : AnyView? {
        get set
    }
    
    func interactorDidDownloadCryptos(result: Result<[crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    func interactorDidDownloadCryptos(result: Result<[crypto], Error>) {
        switch result {
        case .success(let cryptos):
            //view.update
            print("success")
        case .failure(let error):
            //view.update error
            print("error")
        }
    }
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var View: AnyView?
    
    
}
