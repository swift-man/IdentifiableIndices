//
//  IdentifiableIndices.swift
//  MyAge
//
//  Created by SwiftMan on 2023/01/14.
//

import Foundation

public struct IdentifiableIndices<Base: RandomAccessCollection> where Base.Element: Identifiable {
  public typealias Index = Base.Index
  
  public struct Element: Identifiable {
    public let id: Base.Element.ID
    let rawValue: Index
  }
  
  fileprivate var base: Base
}

extension IdentifiableIndices: RandomAccessCollection {
  public var startIndex: Index { base.startIndex }
  public var endIndex: Index { base.endIndex }
  
  public subscript(position: Index) -> Element {
    Element(id: base[position].id, rawValue: position)
  }
  
  public func index(before index: Index) -> Index {
    base.index(before: index)
  }
  
  public func index(after index: Index) -> Index {
    base.index(after: index)
  }
}

extension RandomAccessCollection where Element: Identifiable {
  var identifiableIndices: IdentifiableIndices<Self> {
    IdentifiableIndices(base: self)
  }
}
