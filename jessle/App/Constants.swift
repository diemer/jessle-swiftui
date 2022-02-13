//
//  Constants.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import Foundation
import UIKit

enum Constants {
  enum Game {
    public static let NumberOfSquares: CGFloat = 5
    public static let NumberOfRows: CGFloat = 6
  }
  
  enum Colors: String {
    case yellow
    case gray
    case lightGray
    case backgroundColor
    case green
    case textColor
  }
  
  enum Shape {
    public static let LineWidth: CGFloat = 10.0
    public static let DefaultSquareSize: CGFloat = 50.0
    public static let DefaultSquareSpacing: CGFloat = 10.0
    public static let CornerRadius: CGFloat = 10.0
  }
  
  enum Typography {
    public static let scalingFactor: CGFloat = 0.8
  }
}
