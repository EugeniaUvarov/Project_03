//
//  MainCityVC.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/13/24.
//
import UIKit

class MainCityVC: UIViewController {

    private var mainCityScrollView: MainCityScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        setupUI()
    }

    private func setupUI() {
        // Initialize the MainCityScrollView
        mainCityScrollView = MainCityScrollView()
        mainCityScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the MainCityScrollView to the view controller's view
        view.addSubview(mainCityScrollView)
        
        // Set constraints to make the scroll view fill the screen
        NSLayoutConstraint.activate([
            mainCityScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainCityScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCityScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCityScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
