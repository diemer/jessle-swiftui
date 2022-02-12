//
//  LetterRowVIew.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import SwiftUI

struct LetterRowView: View {
 
  var viewModel: LetterRowViewModel = LetterRowViewModel()
  
  var body: some View {
    LazyHGrid(rows: viewModel.rows, alignment: .center){
      let squaresData = Array(viewModel.squaresData.enumerated())
      ForEach(squaresData, id: \.0) { item in
        let squareContent = item.element.squareContent
        let squareType = item.element.squareType
        LetterSquareView(squareType: squareType, squareContent: squareContent)
          .aspectRatio(1, contentMode: .fit)
//        Text("\(item)")
      }
    }
    .padding(.horizontal)
    
  }
}

typealias SquareData = (squareType: LetterGuess, squareContent: String?)
typealias SquaresData = [SquareData]
typealias RowData = [SquaresData]
extension LetterRowView{
  
  init(squaresData: SquaresData, squareSize: CGFloat) {
    let viewModel = LetterRowViewModel(squaresData: squaresData, squareSize: squareSize)
    self.init(viewModel: viewModel)
  }
  
}

struct LetterRowView_Previews: PreviewProvider {
  static var rowData: SquaresData {
    return [
      (squareType: LetterGuess.correct, squareContent: "W"),
      (squareType: LetterGuess.unguessed, squareContent: nil),
      (squareType: LetterGuess.unguessed, squareContent: nil),
      (squareType: LetterGuess.unguessed, squareContent: nil),
      (squareType: LetterGuess.unguessed, squareContent: nil),
      (squareType: LetterGuess.unguessed, squareContent: nil)
    ]
  }
  static var previews: some View {
    LetterRowView(squaresData: rowData, squareSize: 50)
      .frame(minWidth: 400)
  }
}
