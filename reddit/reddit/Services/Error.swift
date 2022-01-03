//
//  Error.swift
//  reddit
//
//  Created by Ryniere dos Santos Silva on 2022-01-03.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
