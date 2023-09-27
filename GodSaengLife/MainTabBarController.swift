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
        let CalendarVC = CalendarViewController()
        let MyPageVC = MyPageViewController()
        self.viewControllers = [MainVC, CalendarVC, MyPageVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.items?[0].image = UIImage(systemName: "house")?.withTintColor(.systemBlue)
        tabBar.items?[0].selectedImage = UIImage(systemName: "house")?.withTintColor(.lightGray)
        tabBar.items?[1].image = UIImage(systemName: "calendar")?.withTintColor(.systemBlue)
        tabBar.items?[1].selectedImage = UIImage(systemName: "calendar")?.withTintColor(.lightGray)
        tabBar.items?[2].image = UIImage(systemName: "person")?.withTintColor(.systemBlue)
        tabBar.items?[2].selectedImage = UIImage(systemName: "person")?.withTintColor(.lightGray)
    }
}
