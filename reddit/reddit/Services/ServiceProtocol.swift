//
//  ServiceProtocol.swift
//  reddit
//
//  Created by Ryniere dos Santos Silva on 2022-01-03.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    
    func fetchPosts()  -> AnyPublisher<DataResponse<PostListing, NetworkError>, Never>
}
