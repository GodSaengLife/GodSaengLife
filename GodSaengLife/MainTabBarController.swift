//
//  MainTabBarController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/27.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let MainVC = MainViewController()
        let MainNav = UINavigationController(rootViewController: MainVC)
        MainVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let CalendarVC = CalendarViewController()
        let CalendarNav = UINavigationController(rootViewController: CalendarVC)
        CalendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar.fill"))
        
        let MyPageVC = MyPageViewController()
        let MyPageNav = UINavigationController(rootViewController: MyPageVC)
        MyPageVC.tabBarItem = UITabBarItem(title: "My Page", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [MainNav, CalendarNav, MyPageNav]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
    }
    
}
