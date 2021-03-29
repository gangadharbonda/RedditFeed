//
//  Box.swift
//  Reddit
//
//  Created by BondaGangadhar on 3/25/21.
//

import Foundation

final class Box<T> {
  typealias Listener = (T?) -> Void
  var listener: Listener?
    
  var value: T? {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T?) {
    self.value = value
  }
  
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

