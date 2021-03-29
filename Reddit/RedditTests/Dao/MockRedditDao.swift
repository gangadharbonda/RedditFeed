//
//  MockRedditDao.swift
//  RedditTests
//
//  Created by BondaGangadhar on 3/27/21.
//

@testable import Reddit
import Foundation

class MockRedditDao: IRedditFeedHandlerDao {
    let testCase: ReeditFeedTestCase
    
    init(testCaseType: ReeditFeedTestCase) {
        self.testCase = testCaseType
    }
    
    func fetchData(withPagination pagination: String?,
                   completion: @escaping (Result<RedditResponse, DataResponseError>) -> Void) {
        switch  testCase {
        case .emptyResults:
            let redditResponse: RedditResponse = RedditResponse(kind: nil, data: nil)
            completion(Result.success(redditResponse))
        case .resultsWithNextPagination:
            let redditResponse: RedditResponse = createRedditResponse(withChildItemsCount: 2, shouldHaveAfter: true)
            completion(Result.success(redditResponse))
        case .resultsWithOutNextPagination:
            let redditResponse: RedditResponse = createRedditResponse(withChildItemsCount: 2, shouldHaveAfter: false)
            completion(Result.success(redditResponse))
        case .failedRequest:
            completion(Result.failure(DataResponseError.failedRequest))
        case .invalidData:
            completion(Result.failure(DataResponseError.invalidData))
        case .invalidResponse:
            completion(Result.failure(DataResponseError.invalidResponse))
        case .failedResponse:
            completion(Result.failure(DataResponseError.failedResponse))
        }
    }
    
    func createRedditResponse(withChildItemsCount: Int?,
                              shouldHaveAfter: Bool) -> RedditResponse {
        var childDataArray: [Child] = []
        if let childItemCount: Int = withChildItemsCount {
            for index in 0..<childItemCount {
                let childData: ChildData = ChildData(title: "Title-\(index)",
                                                     thumbnailHeight: 60,
                                                     thumbnailWidth: 60,
                                                     score: 10,
                                                     numComments: 10,
                                                     thumbnail: "http://www.google.com/image1.jpg")
                let child: Child = Child(kind: "t3",
                                         data: childData)
                childDataArray.append(child)
            }
        }
        let redditResponseData: RedditResponseData = RedditResponseData(modhash: "",
                                                                        dist: 25,
                                                                        children: childDataArray,
                                                                        after: shouldHaveAfter ? "xyz": nil,
                                                                        before: nil)
        let redditResponse: RedditResponse = RedditResponse(kind: "Listing",
                                                            data: redditResponseData)
        return redditResponse
    }
}
