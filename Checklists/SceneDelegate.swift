//
//  SceneDelegate.swift
//  Checklists
//
//  Created by Dylan DeSantis on 1/29/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let dataModel = DataModel()

    func scene(_ scene: UIScene,
      willConnectTo session: UISceneSession,
      options connectionOptions: UIScene.ConnectionOptions
    ){
    let navigationController = window!.rootViewController as! UINavigationController
      let controller = navigationController.viewControllers[0] as! AllListsViewController
      controller.dataModel = dataModel
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        saveData()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
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
        saveData()
    }
    
    // MARK: - Helper Methods
    func saveData() {
        dataModel.saveChecklists()
    }


}

