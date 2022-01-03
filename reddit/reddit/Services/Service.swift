//
//  Service.swift
//  reddit
//
//  Created by Ryniere dos Santos Silva on 2022-01-03.
//

import Foundation
import Combine
import Alamofire

class Service: ServiceProtocol {
    
    static let shared: ServiceProtocol = Service()
    
    func fetchPosts() -> AnyPublisher<DataResponse<PostListing, NetworkError>, Never> {
        
        let url = URL(string: "https://www.reddit.com/.json")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: PostListing.self, decoder: decoder)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
