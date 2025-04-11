//
//  NetworkManager.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

import Foundation

protocol CocktailListFetchDelegate {
    func didFetchCocktailList(data: [CocktailItem]);
    func didFailWithError(error: String);
}

protocol CocktailDetailFetchDelegate {
    func didFetchCocktailDetail(data: CocktailDetail);
    func didFailWithError(error: String);
}

class NetworkManager {
    
    static let shared = NetworkManager();
    
    var cocktailListDelegate : CocktailListFetchDelegate?
    var cocktailDetailDelegate : CocktailDetailFetchDelegate?
    
    
    func fetchCocktailApiList(type: String) {
    
        let url = URL(string: "\(Api.BASE_URL)\(Api.FILTER)?a=\(type)")!;
        print(url)
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error")
                print(error!)
                DispatchQueue.main.async {
                    self.cocktailListDelegate?.didFailWithError(error: error?.localizedDescription ?? "Something went wrong");
                }
                return;
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invaid response")
                DispatchQueue.main.async {
                    self.cocktailListDelegate?.didFailWithError(error: "Something went wrong");
                }
                return;
            }
            
            if let data = data {
                print(data)
                let decoder = JSONDecoder()
                do {
                    let responseData = try decoder.decode(CocktailListResponseWrapper.self, from: data)
                        DispatchQueue.main.async {
                            self.cocktailListDelegate?.didFetchCocktailList(data: responseData.drinks)
                        }
                    print(responseData.drinks[2].strDrink)
                } catch let error {
                    print(error)
                    DispatchQueue.main.async {
                        self.cocktailListDelegate?.didFailWithError(error: "Something went wrong");
                    }
                }
            }
            
        
        }
        session.resume()

    }
    
    func fetchCocktailDetail(id: String) {
    
        let url = URL(string: "\(Api.BASE_URL)\(Api.DETAIL)?i=\(id)")!;
        print(url)
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error")
                print(error!)
                DispatchQueue.main.async {
                    self.cocktailDetailDelegate?.didFailWithError(error: error?.localizedDescription ?? "Something went wrong");
                }
                return;
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invaid response")
                DispatchQueue.main.async {
                    self.cocktailDetailDelegate?.didFailWithError(error: "Something went wrong");
                }
                return;
            }
            
            if let data = data {
                print(data)
                let decoder = JSONDecoder()
                do {
                    let responseData = try decoder.decode(CocktailDetailResponseWrapper.self, from: data)
                    
                        DispatchQueue.main.async {
                            if(!responseData.drinks.isEmpty){
                                self.cocktailDetailDelegate?.didFetchCocktailDetail(data: responseData.drinks.first!)
                            } else {
                                self.cocktailDetailDelegate?.didFailWithError(error: "Something went wrong");
                            }
                           
                        }
                } catch let error {
                    print(error)
                    DispatchQueue.main.async {
                        self.cocktailDetailDelegate?.didFailWithError(error: "Something went wrong");
                    }
                }
            }
            
        
        }
        session.resume()

    }
    
}
