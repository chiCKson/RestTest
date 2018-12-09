//
//  ViewController.swift
//  RestTest
//
//  Created by Erandra Jayasundara on 12/9/18.
//  Copyright © 2018 Erandra Jayasundara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button:UIButton = {
        let btn = UIButton()
        btn.setTitle("request", for: .normal)
        btn.addTarget(self, action: #selector(getDataPressed), for: .touchUpInside)
        btn.backgroundColor = .red
        return btn
    }()
    let dataView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .gray
        textView.textColor = .white
        return textView
    }()
    @objc func getDataPressed(){
        APIManager.sharedInstance.getPostWithId(postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                self.dataView.text = String(describing: json)
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(dataView)
        dataView.setAnchor(top: button.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        button.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0   )
        // Do any additional setup after loading the view, typically from a nib.
    }


}

