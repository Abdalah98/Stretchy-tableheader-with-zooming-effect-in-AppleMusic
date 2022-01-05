//
//  NetworkManger.swift
//  News
//
//  Created by Abdallah on 8/4/21.
//

import Foundation

class NetworkManger {
    
    static let shared = NetworkManger()
   // "https://itunes.apple.com/search?term=\(searchText)&entity=musicVideo"
    func searchResultMusic(searchText:String,completion: @escaping (Result<SearchResult , ResoneError>) -> Void){
        let urlString =     "https://itunes.apple.com/search?term=\(searchText)&media=music"

        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func searchResultMusicVideo(searchText:String,completion: @escaping (Result<SearchResult , ResoneError>) -> Void){
        let urlString =     "https://itunes.apple.com/search?term=\(searchText)&entity=musicVideo"

        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func fetchGenericJSONData<T:Codable>(urlString:String,completion: @escaping (Result<T , ResoneError>) -> Void){
        guard let url = URL(string: urlString) else {
            completion(.failure(.invaldURL))
            return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let _ = err {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response  = response as? HTTPURLResponse ,response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                // success
                completion(.success(objects))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
}
