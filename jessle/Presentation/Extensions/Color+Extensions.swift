//
//  Color+Extensions.swift
//  jessle
//
//  Created by Dan Diemer on 2/11/22.
//

import Foundation
import SwiftUI

extension Color {
  init(_ constant: Constants.Colors) {
    self.init(constant.rawValue)
  }
}
