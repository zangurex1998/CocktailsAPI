//
//  APIManager.swift
//  CocktailsAPI
//
//  Created by technomix on 02.01.23.
//

import Foundation

protocol APIManagerProtocol {
    func fetchCoctkails(completion : @escaping (Drink) -> Void)
}

class APIManager : APIManagerProtocol {
    func fetchCoctkails(completion: @escaping (Drink) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(Drink.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                    //print(decoded)
                }
            }
            catch{
                print(error)
            }
        }.resume()
    }
    
    
}
