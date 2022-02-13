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
