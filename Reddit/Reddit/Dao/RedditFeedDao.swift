//
//  RedditFeedDao.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/26/21.
//

import Foundation

public class RedditFeedDataDao {
    public static var externalDao: IRedditFeedHandlerDao?
    let dataDao: IRedditFeedHandlerDao

    public init() {
        dataDao = RedditFeedDataDao.externalDao ?? RedditNetworkDao()
    }
    
    func fetchData(withPagination pagination: String?, completion: @escaping (Result<RedditResponse, DataResponseError>) -> Void) {
        dataDao.fetchData(withPagination: pagination,
                          completion: completion)
    }
}
