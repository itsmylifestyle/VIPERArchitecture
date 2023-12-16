//
//  Interactor.swift
//  VIPER
//
//  Created by Айбек on 08.12.2023.
//

import Foundation

//Talks to -> Presenter
protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}

class cryptoInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCryptos(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCryptos(result: .success(cryptos))
            } catch {
                self?.presenter?.interactorDidDownloadCryptos(result: .failure(NetworkError.ParsingFailed))

            }
        }
        task.resume()
    }
}
