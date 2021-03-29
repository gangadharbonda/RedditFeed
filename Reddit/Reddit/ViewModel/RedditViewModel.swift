//
//  RedditViewModel.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/25/21.
//

import Foundation

public class RedditViewModel {
    private let dataDao: RedditFeedDataDao = RedditFeedDataDao()
    public private(set) var feedList: [Child] = [Child]()
    public private(set) var currentFeedInformation: RedditResponse? = nil
    let feedData: Box<[Child]> = Box(nil)
    let errorInfo: Box<DataResponseError> = Box(nil)
    var canRequestData: Bool = true
    
    func canPaginate() -> Bool {
        return currentFeedInformation?.data?.after != nil
    }
   
    public func fetchData() {
        guard canRequestData else {
            return
        }
        canRequestData = false
        dataDao.fetchData(withPagination: currentFeedInformation?.data?.after) { [weak self] result in
            switch result {
            case let .success(feedInfo):
                if let childData = feedInfo.data?.children {
                    self?.currentFeedInformation = feedInfo
                    self?.feedList.append(contentsOf: childData)
                    self?.feedData.value = childData
                } else {
                    self?.currentFeedInformation = nil
                    self?.feedData.value = nil
                }
            case let .failure(error):
                self?.errorInfo.value = error
                break
            }
            self?.canRequestData = true
        }
    }
}
