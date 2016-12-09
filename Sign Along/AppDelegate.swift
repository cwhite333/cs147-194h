//
//  AppDelegate.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/17/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // Override point for customization after application launch.
        // Sets background to a blank/empty image
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
        // Sets shadow (line below the bar) to a blank image
        //UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        //UINavigationBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        
        
        let customColor = UIColor(red: 81, green: 189, blue: 187)
        UINavigationBar.appearance().barTintColor = customColor
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        //UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        UINavigationBar.appearance().titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "Chalkduster", size: 22)!,
                NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        UITabBar.appearance().tintColor = customColor
        UITabBar.appearance().barTintColor = UIColor.darkGrayColor()
        
        //didot
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

