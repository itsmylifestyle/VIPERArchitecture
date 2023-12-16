//
//  Presenter.swift
//  VIPER
//
//  Created by Айбек on 08.12.2023.
//

import Foundation

//talks to -> interactor, router, view

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

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
            View?.update(with: cryptos)
        case .failure(_):
            View?.update(with: "Try again later...")
        }
    }
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var View: AnyView?
    
    
}
