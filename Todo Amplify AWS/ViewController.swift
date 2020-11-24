//
//  ViewController.swift
//  Todo Amplify AWS
//
//  Created by user on 2020/11/23.
//

import UIKit
import SwiftUI
import Amplify
import AmplifyPlugins

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func toSwiftUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView3())

    }

}

