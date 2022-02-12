//
//  LetterSquareView.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import SwiftUI

struct LetterSquareView: View {
  @StateObject var viewModel: LetterSquareViewModel = LetterSquareViewModel()
  
  var body: some View {
    GeometryReader { g in
      ZStack {
        Rectangle()
          .fill(viewModel.squareColor)
        Rectangle()
          .stroke(lineWidth: viewModel.squareStroke)
          .foregroundColor(viewModel.squareStrokeColor)
        if let content = viewModel.squareContent {
          let geoH = g.size.height
          let geoW = g.size.width
          let factor = Constants.Typography.scalingFactor
          let letterSize = geoH > geoW ? geoW * factor : geoH * factor
          Text(content)
            .foregroundColor(viewModel.squareTextColor)
            .font(.system(size: letterSize).bold())
            .position(x: geoW / 2, y: geoH / 2)
        }
      }
    }
    
  }
}

extension LetterSquareView {
  init(squareType: LetterGuess, squareContent: String) {
    self.init(viewModel: LetterSquareViewModel(squareType: squareType, squareContent: squareContent))
  }
}

struct LetterSquareView_Previews: PreviewProvider {
  static var wrongViewModel: LetterSquareViewModel {
    let vm = LetterSquareViewModel()
    vm.squareType = .wrong
    vm.squareContent = "T"
    return vm
  }
  
  static var inWordViewModel: LetterSquareViewModel {
    let vm = LetterSquareViewModel()
    vm.squareType = .inWord
    vm.squareContent = "T"
    return vm
  }
  
  static var correctViewModel: LetterSquareViewModel {
    let vm = LetterSquareViewModel()
    vm.squareType = .correct
    vm.squareContent = "T"
    return vm
  }
  
  
  static var previews: some View {
    let fixedSize: PreviewLayout = .fixed(width: 200, height: 200)
    LetterSquareView()
      .previewLayout(fixedSize)
    LetterSquareView(squareType: .unguessed, squareContent: "T")
      .previewLayout(fixedSize)
    LetterSquareView(squareType: .wrong, squareContent: "T")
      .previewLayout(fixedSize)
    LetterSquareView(squareType: .inWord, squareContent: "T")
      .previewLayout(fixedSize)
    LetterSquareView(squareType: .correct, squareContent: "T")
      .previewLayout(fixedSize)
  }
}
