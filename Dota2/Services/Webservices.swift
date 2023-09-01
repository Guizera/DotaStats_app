//
//  Webservices.swift
//  Dota2
//
//  Created by José Alves da Cunha on 11/01/22.
//

import Foundation

final public class Webservices {
    
    func getPlayerByName(url: URL, completion: @escaping (Result<[Players]?, Error>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    let noDataError = NSError(domain: "com.yourapp.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Received no data from server"])
                    completion(.failure(noDataError))
                    return
                }
                do {
                    let playersList = try JSONDecoder().decode([Players].self, from: data)
                    completion(.success(playersList))
                } catch {
                    completion(.failure(error))
                }
                
            }.resume()
    }
    func getPerfilPlayer(url: URL, completion: @escaping (Result<PerfilPlayer?, Error>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let noDataError = NSError(domain: "com.yourapp.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Received no data from server"])
                completion(.failure(noDataError))
                return
            }
            do {
                let playersList = try JSONDecoder().decode(PerfilPlayer.self, from: data)
                completion(.success(playersList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    func getMatches(url: URL, completion: @escaping (Result<Matches?, Error>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let noDataError = NSError(domain: "com.yourapp.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Received no data from server"])
                completion(.failure(noDataError))
                return
            }
            do {
                let matchesList = try JSONDecoder().decode(Matches.self, from: data)
                completion(.success(matchesList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getRecentMatches(url: URL, completion: @escaping (Result<[RecentMatches]?, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let noDataError = NSError(domain: "com.yourapp.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Received no data from server"])
                completion(.failure(noDataError))
                return
            }
            do {
                let recentMatchesList = try JSONDecoder().decode([RecentMatches].self, from: data)
                completion(.success(recentMatchesList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
