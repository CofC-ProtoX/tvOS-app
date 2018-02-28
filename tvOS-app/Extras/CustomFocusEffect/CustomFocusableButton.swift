//
//  CustomFocusableButton.swift
//  Blackjack
//
//  Created by Bryan Clark on 1/21/16.
//  Copyright © 2016 Blixt. All rights reserved.
//

import UIKit

/// An implementation of CustomParallaxView that implements a pressDown state when Select is clicked.
/// Particularly useful for non-roundrect button shapes.
public class CustomFocusableButton: UIButton {
	public let focusedStyle: FocusedStyle

    private init(focusedStyle: FocusedStyle) {
		self.focusedStyle = focusedStyle

		super.init(frame: CGRect.zero)

		view.layer.shadowColor = focusedStyle.shadowColor
		view.layer.shadowOffset = focusedStyle.shadowOffset
		view.layer.shadowRadius = focusedStyle.shadowRadius
	}
    
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Focus Engine Stuff

	// MARK: Animating selection - buttons should shrink & all that when they're clicked!
    public override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
		guard presses.count == 1 else { return } // If you press multiple buttons at the same time, that shouldn't trigger a pressDown() animation.

        for press in presses where press.type == .select {
			pressDown()
		}
	}

    public override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)

        for press in presses where press.type == .select {
			pressUp()
		}
	}

    public override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesCancelled(presses, with: event)

        for press in presses where press.type == .select {
			pressUp()
		}
	}

	private func pressDown() {
        UIView.animate(withDuration: 0.1,
			delay: 0.0, usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0.0,
            options: .beginFromCurrentState,
			animations: { () -> Void in
                self.displayAsFocused(focused: false)
			}, completion: nil)
	}

	private func pressUp() {
        UIView.animate(withDuration: 0.2,
			delay: 0,
			usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0,
            options: .beginFromCurrentState,
			animations: { () -> Void in
                self.displayAsFocused(focused: true)
			}, completion: nil)
	}
}

extension CustomFocusableButton: CustomFocusableViewType {
	public var view: UIView { return self }
}
