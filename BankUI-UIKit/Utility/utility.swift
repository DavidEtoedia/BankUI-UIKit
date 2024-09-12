//
//  Spacer.swift
//  BankUI-UIKit
//
//  Created by Inyene Etoedia on 11/09/2024.
//

import Foundation
import UIKit

// Reusable Text

class TextLabel: UILabel {
    init(labelText: String, size: CGFloat , labelColor: UIColor, weight: UIFont.Weight) {
        super.init(frame: .zero)
        self.text = labelText
        self.textColor = labelColor
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSMutableAttributedString(string: labelText)
        self.attributedText = attributedString //Setup Label to AttributedString for custom font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class SpacerView: UIView {
    
    init(width: CGFloat = 0, height: CGFloat = 0) {
        super.init(frame: .zero)
        setupView(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if width > 0 {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        if height > 0 {
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: height)
            ])
        }
    }
}
