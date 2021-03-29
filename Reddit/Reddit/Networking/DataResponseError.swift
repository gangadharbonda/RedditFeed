//
//  DataResponseError.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/23/21.
//

import Foundation

public enum DataResponseError: Error {
    case failedRequest
    case invalidData
    case invalidResponse
    case failedResponse
    case noData
    
    func getErrorMessage() -> String {
        switch self {
        case .failedRequest:
            return "Your request failed"
        case .invalidData:
            return "Got invalid data"
        case .invalidResponse:
            return "Got invalid response"
        case .failedResponse:
            return "Got failed response"
        case .noData:
            return "There is not data available for the response"
        }
    }
}
