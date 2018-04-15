//
//  ViewController.swift
//  ScreenShare
//
//  Created by SirArkimedes on 04/07/2018.
//  Copyright (c) 2018 SirArkimedes. All rights reserved.
//

import UIKit
import ScreenShare

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = view.center
        button.setTitle("Press me!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func buttonPressed() {
        let view = PromptPopView(with: self)
        self.view.addSubview(view)
    }

}

extension ViewController: PromptPopViewDelegate {

    public func didTapPrompt() {
        print("tapped")
    }

}

