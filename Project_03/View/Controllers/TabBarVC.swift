//
//  ViewController.swift
//  Project_03
//
//  Created by Eugenia Uvarov on 11/6/24.
//
import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        setupViewControllers()
        
        // Replace the default tab bar with the custom tab bar
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
    }
    
    private func setupViewControllers() {
        // Initialize MainCityVC, which will be the first screen
        let mainCityVC = MainCityVC()
        mainCityVC.title = ""
        let mainCityNavController = UINavigationController(rootViewController: mainCityVC)
        
        // Create and embed SettingsVC inside a navigation controller
        let settingsVC = SettingsVC()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "map"), tag: 0) // tag is fine, does not affect order
        let settingsNavController = UINavigationController(rootViewController: settingsVC)
        
        // CityListVC is added directly to the tab bar controllers
        let cityListVC = CityListVC()
        cityListVC.tabBarItem = UITabBarItem(title: "Cities", image: UIImage(systemName: "list.dash"), tag: 1)
        
        // Add view controllers to the tab bar
        self.viewControllers = [mainCityNavController, settingsNavController, cityListVC]
        
        // Set MainCityVC as the initial view (the first tab)
        self.selectedIndex = 0 // This is fine
    }
    
    class CustomTabBar: UITabBar {
        
        private let pageControl = UIPageControl()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupPageControl()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupPageControl()
        }
        
        private func setupPageControl() {
            pageControl.numberOfPages = 5
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .white
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(pageControl)
            
            NSLayoutConstraint.activate([
                pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
                pageControl.centerYAnchor.constraint(equalTo: centerYAnchor),
                pageControl.widthAnchor.constraint(equalToConstant: 150),
                pageControl.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            let items = self.subviews.compactMap { $0 as? UIControl }
            
            if let mapItem = items.first(where: { $0.tag == 0 }) {
                var frame = mapItem.frame
                frame.origin.x = 0
                mapItem.frame = frame
            }
            
            if let listItem = items.first(where: { $0.tag == 1 }) {
                var frame = listItem.frame
                frame.origin.x = self.frame.width - frame.width
                listItem.frame = frame
            }
        }
    }
}
