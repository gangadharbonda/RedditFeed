//
//  Result.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/23/21.
//

import Foundation

public enum Result<T, U: Error> {
  case success(T)
  case failure(U)
}
