//
//  SceneDelegate.swift
//  GodSaengLife
//
//  Created by t2023-m0078 on 2023/09/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let MainVC = MainViewController()
        let CalendarVC = CalendarViewController()
        let MyPageVC = MyPageViewController()
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([MainVC,CalendarVC,MyPageVC], animated: true)
        
        if let items = tabBarController.tabBar.items {
            items[1].image = UIImage(systemName: "calendar")?.withTintColor(.systemBlue)
            items[1].selectedImage = UIImage(systemName: "calendar")?.withTintColor(.lightGray)
            
            items[0].image = UIImage(systemName: "house")?.withTintColor(.systemBlue)
            items[0].selectedImage = UIImage(systemName: "house")?.withTintColor(.lightGray)
            
            items[2].image = UIImage(systemName: "person")?.withTintColor(.systemBlue)
            items[2].selectedImage = UIImage(systemName: "person")?.withTintColor(.lightGray)
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
//        window?.rootViewController = MainViewController()
//        window?.makeKeyAndVisible()
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

