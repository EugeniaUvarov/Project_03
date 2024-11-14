//
//  CityListVC.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/6/24.
//

import UIKit

class CityListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var cities = ["New York", "London", "Paris", "Tokyo", "Sydney"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
        self.view.addSubview(tableView)
        
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        
        self.title = ""
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected city: \(cities[indexPath.row])")
    }
}
