//
//  SceneDelegate.swift
//  GodSaengLife
//
//  Created by t2023-m0078 on 2023/09/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UNUserNotificationCenterDelegate{
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = AlarmLandingViewController()
//        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        if UserDefaults.standard.string(forKey: "nickname") == nil {
            let rootVC = RegistrationViewController()
            changeRootViewController(rootVC)
        }
        
        if let notificationResponse = connectionOptions.notificationResponse {
            handleNotificationResponse(notificationResponse)
        }
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    func handleNotificationResponse(_ response: UNNotificationResponse) {
        let identifier = response.notification.request.identifier
        
        if let tabBarController = self.window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as? UINavigationController {
            switch identifier {
            case "alarm":
                let targetVC = AlarmLandingViewController()
                navigationController.pushViewController(targetVC, animated: true)
            case "exercise":
                let targetVC = MainViewController()
                navigationController.pushViewController(targetVC, animated: true)
            default:
                break
            }
        } else {
            print("Navigation controller not found")
        }
    }
    
    func changeRootViewController(_ viewController: UIViewController) {
        guard let window = self.window else { return }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        handleNotificationResponse(response)
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
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

