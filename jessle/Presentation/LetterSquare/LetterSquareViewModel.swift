//
//  LetterSquareViewModel.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import Foundation
import SwiftUI

class LetterSquareViewModel: ObservableObject {
  @Published var squareContent: String?
  @Published var squareType: LetterGuess = .unguessed
  
  convenience init(squareType: LetterGuess, squareContent: String) {
    self.init()
    self.squareType = squareType
    self.squareContent = squareContent
  }
  
  var squareColor: Color {
    switch squareType {
    case .unguessed:
      return Color(Constants.Colors.backgroundColor)
    case .wrong:
      return Color(Constants.Colors.gray)
    case .inWord:
      return Color(Constants.Colors.yellow)
    case .correct:
      return Color(Constants.Colors.green)
    }
  }
  
  var squareStroke: CGFloat {
    switch squareType {
    case .unguessed:
      return Constants.Shape.LineWidth
    default:
      return 0
    }
  }
  
  var squareStrokeColor: Color {
    switch squareType {
    case .unguessed:
      return Color(Constants.Colors.gray)
    default:
      return Color.clear
    }
  }
  
  var squareTextColor: Color {
    switch squareType {
    case .unguessed:
      return Color(Constants.Colors.textColor)
    default:
      return Color(Constants.Colors.backgroundColor)
    }
  }
}
