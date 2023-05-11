//
//  String+Localizable.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation

extension String {

  var localized: String {
    NSLocalizedString(self, comment: "")
  }

  func localized(with arguments: [CVarArg]) -> String {
    String(format: localized, locale: Locale.current, arguments: arguments)
  }
}
