//
//  ForEach+.swift
//  MyAge
//
//  Created by SwiftMan on 2023/01/14.
//

import Foundation
import SwiftUI

extension ForEach where ID == Data.Element.ID,
                        Data.Element: Identifiable,
                        Content: View {
  public init<T>(
    _ indices: Data,
    @ViewBuilder content: @escaping (Data.Index) -> Content
  ) where Data == IdentifiableIndices<T> {
    self.init(indices) { index in
      content(index.rawValue)
    }
  }
}

extension ForEach where ID == Data.Element.ID,
                        Data.Element: Identifiable,
                        Content: View {
  public init<T>(
    _ data: Binding<T>,
    @ViewBuilder content: @escaping (T.Index, Binding<T.Element>) -> Content
  ) where Data == IdentifiableIndices<T>, T: MutableCollection {
    self.init(data.wrappedValue.identifiableIndices) { index in
      content(
        index.rawValue,
        Binding(
          get: { data.wrappedValue[index.rawValue] },
          set: { data.wrappedValue[index.rawValue] = $0 }
        )
      )
    }
  }
}
