//
//  KeyboardKeyView.swift
//  jessle
//
//  Created by Dan Diemer on 2/13/22.
//

import SwiftUI

struct KeyboardKeyView: View {
  var viewModel: KeyboardKeyViewModel = KeyboardKeyViewModel()
  
  var body: some View {
    Button(action: viewModel.onPress) {
      if viewModel.type == .Backspace {
        Image(systemName: Constants.Icons.Backspace)
      } else {
        Text(viewModel.textContent.uppercased())
          .bold()
      }
    }
    .buttonStyle(KeyStyle(fillColor: viewModel.keyBackgroundColor, textColor: viewModel.keyTextColor))
    .disabled(viewModel.disabled)
  }

}
  
extension KeyboardKeyView {
  init(content: String? = nil, type: KeyboardKeyView.KeyType, letterType: LetterGuess = .unguessed, onPress: @escaping KeyOnPress) {
    viewModel = KeyboardKeyViewModel(content: content, type: type, letterType: letterType, onPress: onPress)
  }
  
  struct KeyStyle: ButtonStyle {
    var fillColor: Color
    var textColor: Color
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(configuration.isPressed ? Color(Constants.Colors.gray) : fillColor)
                .foregroundColor(textColor)
                .clipShape(RoundedRectangle(cornerRadius: Constants.Shape.CornerRadius))
        }
  }
  
  enum KeyType {
    case Letter
    case Enter
    case Backspace
  }
}


struct KeyboardKeyView_Previews: PreviewProvider {
  static var viewModel: KeyboardKeyViewModel {
    let vm = KeyboardKeyViewModel()
    
    return vm
  }
  static var previews: some View {
    let fixedSize = PreviewLayout.fixed(width: 50, height: 100)
    KeyboardKeyView(content: "W", type: .Letter, letterType: .unguessed, onPress: {})
      .previewLayout(fixedSize)

    KeyboardKeyView(content: "W", type: .Letter, letterType: .wrong, onPress: {})
      .previewLayout(fixedSize)

    KeyboardKeyView(content: "W", type: .Letter, letterType: .inWord, onPress: {})
      .previewLayout(fixedSize)

    KeyboardKeyView(content: "W", type: .Letter, letterType: .correct, onPress: {})
      .previewLayout(fixedSize)
    KeyboardKeyView(type: .Backspace, onPress: {})
      .previewLayout(fixedSize)
    KeyboardKeyView(type: .Enter, onPress: {})
      .previewLayout(.fixed(width: 200, height: 100))
  }
}
