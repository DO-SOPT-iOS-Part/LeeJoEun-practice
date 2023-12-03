//
//  Observable.swift
//  sopt33-7th-seminar
//
//  Created by 이조은 on 12/2/23.
//

import Foundation

final class Observable<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?

    var value: T {
    didSet {
      listener?(value)
    }
  }

  init(_ value: T) {
    self.value = value
  }

  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }

}
