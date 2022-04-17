//
//  BaseNetwork.swift
//  BibliotecaPeliculas
//
//  Created by Mikel Cobian on 15/4/22.
//

import Foundation
import Alamofire

final class NetworkingProvider{
    
    static let shared = NetworkingProvider()
    
    private let apiKey = "145f8769e0312def201ecb72d5f455ed"
    private let baseUrl = "https://api.themoviedb.org/3"
    private let statusOk = 200...299
    
    
    func getPopularMovies(success: @escaping (_ movies: [Result]) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        let url = "\(baseUrl)/movie/popular/?api_key=\(apiKey)"
        
        
        AF.request(url, method: .get).responseData { (response) in
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let value):
                do {
                    
                   let decoder = JSONDecoder()
                    let movies = try decoder.decode(MovieResponse.self, from: value)
                    success(movies.results)
                } catch {
                    print(error)
                }
            }
 
    }
}


}
