//
//  GameBoardView.swift
//  jessle
//
//  Created by Dan Diemer on 2/12/22.
//

import SwiftUI

struct GameBoardView: View {
  var viewModel: GameBoardViewModel = GameBoardViewModel()
  
  var body: some View {
    let rowData = Array(viewModel.rowData.enumerated())
    GeometryReader { g in
      let geoW = g.size.width
      let squareSize = geoW / Constants.Game.NumberOfSquares - (Constants.Shape.DefaultSquareSpacing)
      VStack {
        ForEach(rowData, id: \.0) { row in
          LetterRowView(squaresData: row.element, squareSize: squareSize).frame(maxHeight: squareSize)
        }
      }
      .padding(.horizontal, Constants.Shape.DefaultSquareSpacing)
    }
  }
}

struct GameBoardView_Previews: PreviewProvider {
  static var gameViewModel: GameBoardViewModel {
    let firstRow = [
      (squareType: LetterGuess.correct, squareContent: "W"),
      (squareType: LetterGuess.wrong, squareContent: "A"),
      (squareType: LetterGuess.wrong, squareContent: "S"),
      (squareType: LetterGuess.wrong, squareContent: "P"),
      (squareType: LetterGuess.wrong, squareContent: "S")
    ]
    let secondRow = [
      (squareType: LetterGuess.correct, squareContent: "W"),
      (squareType: LetterGuess.inWord, squareContent: "I"),
      (squareType: LetterGuess.unguessed, squareContent: "L"),
      (squareType: LetterGuess.unguessed, squareContent: "L"),
      (squareType: LetterGuess.unguessed, squareContent: "S")
    ]
    let emptyRow = [
        (squareType: LetterGuess.unguessed, squareContent: ""),
        (squareType: LetterGuess.unguessed, squareContent: nil),
        (squareType: LetterGuess.unguessed, squareContent: nil),
        (squareType: LetterGuess.unguessed, squareContent: nil),
        (squareType: LetterGuess.unguessed, squareContent: nil)
    ]

    let vm = GameBoardViewModel()
    vm.rowData = [
      firstRow,
      secondRow,
      emptyRow,
      emptyRow,
      emptyRow,
      emptyRow
    ]
    return vm
  }
  static var previews: some View {
    GameBoardView(viewModel: gameViewModel)
  }
}
