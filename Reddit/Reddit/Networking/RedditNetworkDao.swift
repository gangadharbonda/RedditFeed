//
//  RedditNetworkDao.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/23/21.
//

import Foundation

final class RedditNetworkDao: IRedditFeedHandlerDao {
    private static let host: String = "www.reddit.com"
    private static let path: String = "/.json"
  
    let session: URLSession
  
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
  
    func fetchData(withPagination pagination: String? = nil, completion: @escaping (Result<RedditResponse, DataResponseError>) -> Void) {
    
    var urlBuilder = URLComponents()
    urlBuilder.scheme = "http"
    urlBuilder.host = RedditNetworkDao.host
    urlBuilder.path = RedditNetworkDao.path
    if let paginationId: String = pagination  {
        urlBuilder.queryItems = [
          URLQueryItem(name: "after", value: paginationId)
        ]
    }
    let requestURL: URL = urlBuilder.url!
        print("URL -- \(requestURL.absoluteURL)")
    let urlRequest: URLRequest = URLRequest(url: requestURL)
    
    session.dataTask(with: urlRequest, completionHandler: { data, response, error in
        guard error == nil else {
          print("Failed request from Reddit: \(error!.localizedDescription)")
          completion(Result.failure(DataResponseError.failedRequest))
          return
        }
        
        guard let data = data else {
          print("No data returned from Reddit")
          completion(Result.failure(DataResponseError.noData))
          return
        }
        
        guard let response = response as? HTTPURLResponse else {
          print("Unable to process Reddit response")
            completion(Result.failure(DataResponseError.invalidResponse))
          return
        }
        
        guard response.hasSuccessStatusCode else {
          print("Failure response from Reddit: \(response.statusCode)")
          completion(Result.failure(DataResponseError.failedRequest))
          return
        }
        
        guard let decodedResponse = try? JSONDecoder().decode(RedditResponse.self, from: data) else {
            completion(Result.failure(DataResponseError.invalidData))
            return
      }
      
        completion(Result.success(decodedResponse))
    }).resume()
  }
}

