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
        
        //-MARK: This way it works
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.delegate = firstVC
        firstVC.delegate.passData(index: self.globalIndex)
        present(firstVC, animated: true)
        //-MARK: This way it doesn't
        /*
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
         firstVC.delegate = firstVC
         firstVC.delegate.passData(index: self.globalIndex)
         dismiss(animated: true, completion: nil) or even when putting these two lines (firstVC.delegate = firstVC and firsVC.delegate.passData(index: self.globalIndex)) into completion block in dismsiss doesn't work
         */
        
    }
}

extension SecondViewController: passDataDelegate {
    func passData(index: Int) {
        globalIndex = index
    }
}
