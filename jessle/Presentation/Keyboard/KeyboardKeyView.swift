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
    .disabled(viewModel.disabled)
  }

}
  
extension KeyboardKeyView {
  init(content: String? = nil, type: KeyboardKeyView.KeyType, letterType: LetterGuess = .unguessed, onPress: @escaping KeyOnPress) {
    viewModel = KeyboardKeyViewModel(content: content, type: type, letterType: letterType, onPress: onPress)
  }
  
  
  enum KeyType {
    case Letter
    case Enter
    case Backspace
  }
}


struct KeyboardKeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardKeyView()
    }
}
