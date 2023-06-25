//
//  HapticUtil.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/24/23.
//

import Foundation
import UIKit

func generateHapticFeedback() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.impactOccurred()
}
