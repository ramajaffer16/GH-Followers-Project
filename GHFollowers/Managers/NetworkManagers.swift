//
//  NetworkManagers.swift
//  GHFollowers
//
//  Created by RAMA on 03/03/2025.
//

import UIKit
class NetworkManager{
    static let shared = NetworkManager()
    
    private init() {}
    
    func getFollowers(for username:String, page:Int, completion:@escaping(Result<[FollowersResponse],Error>) -> Void){
        let Url = "https://api.github.com/users/\(username)/followers"
        
        let url = URL(string: Url)!
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data Received", code: 0, userInfo: nil)))
                return
            }
            
            guard let httpresponse = response as? HTTPURLResponse,(200...299).contains(httpresponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid Response", code: 1, userInfo: nil)))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([FollowersResponse].self, from: data)
                completion(.success(followers))
                
                }catch{
                    completion(.failure(error))
                
            }
            
        }
        task.resume() 
        
    }
    
    
}
