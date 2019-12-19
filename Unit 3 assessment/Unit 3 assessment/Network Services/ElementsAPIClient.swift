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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
