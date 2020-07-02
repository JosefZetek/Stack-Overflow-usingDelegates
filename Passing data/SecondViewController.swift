//
//  SecondViewController.swift
//  Passing data
//
//  Created by Pepa Zetek on 30/03/2020.
//  Copyright © 2020 Pepa Zetek. All rights reserved.
//

import UIKit

protocol passDelegate {
    func passData(index: Int?)
}

class SecondViewController: UIViewController {
    
    var globalIndex: Int!
    var delegat: passDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button(_ sender: UIButton) {
        delegat.passData(index: globalIndex) //Call delegate
        dismiss(animated: true, completion: nil)

        
        
    }
}

