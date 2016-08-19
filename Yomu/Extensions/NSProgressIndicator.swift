//
//  NSProgressIndicator.swift
//  Yomu
//
//  Created by Sendy Halim on 8/19/16.
//  Copyright © 2016 Sendy Halim. All rights reserved.
//

import AppKit

extension NSProgressIndicator {
  func animating(shouldAnimate: Bool) {
    if shouldAnimate {
      startAnimation(nil)
    } else {
      stopAnimation(nil)
    }
  }
}
