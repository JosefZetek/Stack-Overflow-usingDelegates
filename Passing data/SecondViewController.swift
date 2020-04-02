//
//  SecondViewController.swift
//  Passing data
//
//  Created by Pepa Zetek on 30/03/2020.
//  Copyright © 2020 Pepa Zetek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var globalIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button(_ sender: UIButton) {
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.delegate = firstVC
        firstVC.delegate.passData(index: self.globalIndex)
        
        present(firstVC, animated: true)
        
    }
}

extension SecondViewController: passDataDelegate {
    func passData(index: Int) {
        globalIndex = index
    }
}
