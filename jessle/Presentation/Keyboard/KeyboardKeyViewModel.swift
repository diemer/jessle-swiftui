//
//  KeyboardKeyViewModel.swift
//  jessle
//
//  Created by Dan Diemer on 2/13/22.
//

import Foundation
import SwiftUI

typealias KeyOnPress = () -> Void
class KeyboardKeyViewModel: ObservableObject {
  var content: String? = nil
  var type: KeyboardKeyView.KeyType = .Letter
  var letterType: LetterGuess = .unguessed
  private var _onPress: KeyOnPress? = nil
  
  convenience init(content: String?, type: KeyboardKeyView.KeyType, letterType: LetterGuess, onPress: @escaping KeyOnPress) {
    self.init()
    self.content = content
    self.type = type
    self.letterType = letterType
    self._onPress = onPress
  }
  
  func onPress() {
    if letterType == .unguessed {
      _onPress?()
    }
  }
  
  var disabled: Bool {
    letterType != .unguessed
  }
  
  var textContent: String {
    guard type != .Enter else {
      return "Enter"
    }
    return content ?? ""
  }
  
  var keyTextColor: Color {
    switch letterType {
    case .unguessed:
      return Color(Constants.Colors.textColor)
    case .wrong:
      return Color(Constants.Colors.backgroundColor)
    case .inWord:
      return Color(Constants.Colors.backgroundColor)
    case .correct:
      return Color(Constants.Colors.backgroundColor)
    }
  }
  
  var keyBackgroundColor: Color {
    guard type == .Letter else {
      return Color(Constants.Colors.lightGray)
    }
    switch letterType {
    case .unguessed:
      return Color(Constants.Colors.lightGray)
    case .wrong:
      return Color(Constants.Colors.gray)
    case .inWord:
      return Color(Constants.Colors.yellow)
    case .correct:
      return Color(Constants.Colors.green)
    }
  }
}
