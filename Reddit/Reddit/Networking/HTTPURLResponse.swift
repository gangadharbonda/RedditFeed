//
//  HTTPURLResponse.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/23/21.
//

import Foundation

extension HTTPURLResponse {
  var hasSuccessStatusCode: Bool {
    return 200...299 ~= statusCode
  }
}
