//
//  ElementsAPIClient.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementsSAPIClient {
    
    // function to access data
    static func fetchElements (completion: @escaping (Result<[Elements], AppError>) -> ()) {
        
        // the string url
        let elementsEndpointURLString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        // create a url from the above string
        // this needs a guard statment to unwrapp it
        
        guard let url = URL(string: elementsEndpointURLString) else {
            completion(.failure(.badURL(elementsEndpointURLString)))
            return
        }
        
        // create a request
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request, completion: {
            (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                // this is where the array of questions is gathered
                do{
                    let elements = try JSONDecoder().decode([Elements].self, from: data)

                    completion(.success(elements))
                } catch {
                    
                    completion(.failure(.decodingError(error)))
                }
            }
        })
    }
    
    
    // function to post the favorites
    static func postFavoriteElements(element: Elements ,completion: @escaping (Result < Bool, AppError> ) ->()) {
        
        // String
        let favoriteEndpointURL = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        // convert the string into type url
        guard let url = URL(string: favoriteEndpointURL) else {
            completion(.failure(.badURL(favoriteEndpointURL)))
            return
        }
        
        do {
            let data = try JSONEncoder().encode(element)
            
            // get access to the data in the url
                  var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            // the below request is from the above url request
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = data
            
            NetworkHelper.shared.performDataTask(with: request) { result in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(.encodingError(error)))
        }
    }
    
    
    // get the posted favorites
    static func getFavs(elememnts: [Elements] , completion: @escaping (Result <[Elements], AppError>) -> ()) {
        
        // string for the favorites
        let favPostedstring = ""
        
        guard let url = URL(string: favPostedstring) else {
            completion(.failure(.badURL(favPostedstring)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request, completion: {
            result in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    
                    let favElements = try JSONDecoder().decode([Elements].self, from: data)
                    
                    completion(.success(favElements))

                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        })
    }
    
    
    //The end of the struct
}
