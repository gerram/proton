//
//  FindTextCommand.swift
//  Proton
//
//  Created by Rajdeep Kwatra on 18/1/20.
//  Copyright © 2020 Rajdeep Kwatra. All rights reserved.
//

import Foundation
import UIKit

import Proton

class FindTextCommand: RendererCommand {
    var text = ""

    init(text: String) {
        self.text = text
    }

    func execute(on renderer: RendererView) {
        for content in renderer.contents() {
            if case let .text(_, attributedString) = content.type,
                let range = attributedString.string.range(of: text) {
                let scrollRange = attributedString.string.makeNSRange(from: range)
                renderer.addAttribute(.backgroundColor, value: UIColor.cyan, at: scrollRange)
                renderer.scrollRangeToVisible(scrollRange)
                break
            }
        }
    }
}
