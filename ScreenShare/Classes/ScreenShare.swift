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

import Foundation

open class ScreenShare {

    static open var instance = ScreenShare()

    private var screen: UIImage?

    open func createScreenshotListener() {
        NotificationCenter.default.addObserver(forName: .UIApplicationUserDidTakeScreenshot, object: nil, queue: .main) { notification in
            self.receivedScreenshot()
        }
    }

    private func receivedScreenshot() {
        guard let window = UIApplication.shared.keyWindow else {
            assert(false, "keyWindow is nil!")
        }
        guard let root = window.rootViewController else {
            assert(false, "RootViewController doesn't exist!")
        }

        // Don't do anything if there is no image.
        if let screen = grabCurrentScreen(with: window) {
            self.screen = screen

            let view = PromptPopView(with: self)
            root.view.addSubview(view)
        }
    }

    private func grabCurrentScreen(with window: UIWindow) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(window.layer.frame.size, false, UIScreen.main.scale)

        guard let context = UIGraphicsGetCurrentContext() else {
            assert(false, "UIGraphicsGetCurrentContext() is nil!")
        }

        window.layer.render(in:context)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

}

extension ScreenShare: PromptPopViewDelegate {

    public func didTapPrompt() {
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            assert(false, "RootViewController doesn't exist!")
        }

        print("tapped")

        if let screen = screen {
            let vc = UIActivityViewController(activityItems: [screen], applicationActivities: nil)
            root.present(vc, animated: true, completion: nil)
        }
    }

}
