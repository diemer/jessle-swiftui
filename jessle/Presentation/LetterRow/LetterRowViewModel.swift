//
//  LetterRowViewModel.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import Foundation
import SwiftUI

class LetterRowViewModel: ObservableObject {
  var squareSize: CGFloat = Constants.Shape.DefaultSquareSize
  var squareSpacing: CGFloat = Constants.Shape.DefaultSquareSpacing
  var squaresData: SquaresData = []
  var rows: [GridItem] {
    return [
      GridItem(.fixed(squareSize), spacing: squareSpacing, alignment: .center)
    ]
  }
  
  convenience init(squaresData: SquaresData, squareSize: CGFloat) {
    self.init()
    self.squaresData = squaresData
    self.squareSize = squareSize
  }

}
