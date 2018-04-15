/*
 Copyright (c) 2018 SirArkimedes <sirarkimedes@gmail.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

public protocol PromptPopViewDelegate {
    func didTapPrompt()
}

open class PromptPopView: UIView {

    private let padding: CGFloat = 10.0
    private let delegate: PromptPopViewDelegate?

    private var label: UILabel!

    public init(with delegate: PromptPopViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)

        createSubviews()
        addTouch()
    }

    required public init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)

        createSubviews()
        addTouch()
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)

        if let superview = superview {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true

            let constraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0)
            superview.addConstraint(constraint)
            constraint.isActive = true

            label.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
            label.heightAnchor.constraint(equalToConstant: label.frame.height).isActive = true

            bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: padding).isActive = true
        }

        customize()
    }

    private func addTouch() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchedView))
        addGestureRecognizer(tap)
    }

    private func createSubviews() {
        label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = """
                        📸 You took a screenshot! 📸
                        Would you like to share it?
                     """

        label.numberOfLines = 0
        label.sizeToFit()
    }

    private func customize() {
        backgroundColor = .blue
    }

    @objc private func touchedView() {
        delegate?.didTapPrompt()
    }

}
