//
//  RedditTests.swift
//  RedditTests
//
//  Created by BondaGangadhar on 3/25/21.
//

@testable import Reddit
import XCTest

class RedditFeedTests: XCTestCase {
    
    func testRedditFeedDataWithEmptyResults() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .emptyResults)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssert(redditViewModel.feedList.isEmpty, "Though we got empty results viewModel is showing data")
    }
    
    func testFeedDataWithResultsAndNextPageId() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .resultsWithNextPagination)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssert(!redditViewModel.feedList.isEmpty, "Though we got response data from server we got empty results")
        XCTAssert(redditViewModel.feedList.count == 2, "Total number of items did not match from response obtained from server")
        XCTAssert(redditViewModel.canPaginate(), "Next pagination id is not available in the response data")
    }
    
    func testFeedDataWithResultsAndWithoutNextPageId() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .resultsWithOutNextPagination)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssert(!redditViewModel.feedList.isEmpty, "Though we got response data from server we got empty results")
        XCTAssert(redditViewModel.feedList.count == 2, "Total number of items did not match from response obtained from server")
        XCTAssert(!redditViewModel.canPaginate(), "Next pagination id is available in the response data though it should not be available")
    }
    
    func testFetchDataWithFailedRequest() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .failedRequest)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssertNil(redditViewModel.currentFeedInformation, "Though request failed viewModel has current page response")
        XCTAssert(redditViewModel.feedList.isEmpty, "Though we got empty results viewModel is showing data")
        XCTAssert(redditViewModel.errorInfo.value == .failedRequest, "The error should be of category failed request")
    }
    
    func testFetchDataWithInvalidData() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .invalidData)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssertNil(redditViewModel.currentFeedInformation, "Though request failed with invalid data viewModel has current page response")
        XCTAssert(redditViewModel.feedList.isEmpty, "Though we got empty results viewModel is showing data")
        XCTAssert(redditViewModel.errorInfo.value == .invalidData, "The error should be of category invalid request")
    }
    
    func testFetchDataWithInvalidResponse() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .invalidResponse)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssertNil(redditViewModel.currentFeedInformation, "Though request failed with invalida response viewModel has current page response")
        XCTAssert(redditViewModel.feedList.isEmpty, "Though we got empty results viewModel is showing data")
        XCTAssert(redditViewModel.errorInfo.value == .invalidResponse, "The error should be of category invalid response")
    }
    
    func testFetchDataWithFailedResponse() {
        let mockDao: IRedditFeedHandlerDao = MockRedditDao(testCaseType: .failedResponse)
        RedditFeedDataDao.externalDao = mockDao
        let redditViewModel: RedditViewModel = RedditViewModel()
        redditViewModel.fetchData()
        XCTAssertNil(redditViewModel.currentFeedInformation, "Though request failed with failed response viewModel has current page response")
        XCTAssert(redditViewModel.feedList.isEmpty, "Though we got empty results viewModel is showing data")
        XCTAssert(redditViewModel.errorInfo.value == .failedResponse, "The error should be of category failed response")
    }
}

