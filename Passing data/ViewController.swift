//
//  ViewController.swift
//  Passing data
//
//  Created by Pepa Zetek on 30/03/2020.
//  Copyright © 2020 Pepa Zetek. All rights reserved.
//

import UIKit

protocol passDataDelegate {
    func passData(index: Int)
}

class ViewController: UIViewController  {
    
    var globalIndex: Int!
    let array = ["Row 1", "Row 2", "Row 3", "Row 4"]
    var delegate: passDataDelegate!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
    }

    func initialConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableView")
    }
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource, passDataDelegate {
    
    func passData(index: Int) {
        globalIndex = index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableView", for: indexPath) as! CustomTableViewCell
        cell.label.text = array[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You previously pressed row with index \(globalIndex)")
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        delegate = secondVC
        delegate.passData(index: indexPath.row)
        present(secondVC, animated: true)
    }
}
