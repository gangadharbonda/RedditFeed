//
//  IRedditFeedHandlerDao.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/27/21.
//

public protocol IRedditFeedHandlerDao {
    func fetchData(withPagination pagination: String?, completion: @escaping (Result<RedditResponse, DataResponseError>) -> Void)
}
