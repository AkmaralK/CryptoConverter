//
//  AppDelegate.swift
//  CryptoConverter
//
//  Created by Akmaral on 10/9/20.
//  Copyright © 2020 Akmaral. All rights reserved.
//

import AVFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var audioPlayer = AVAudioPlayer()
 
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
      //add sound in LaunchScreen
        func playSound(file:String, ext:String) -> Void {
            do {
                let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: file, ofType: ext)!)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch let error {
                NSLog(error.localizedDescription)
            }
        }
        playSound(file: "LaunchScreen", ext: "wav")
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

