//
//  AppDelegate.swift
//  MathHelper
//
//  Created by Dragon on 12/9/14.
//  Copyright (c) 2014 Codepixl. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        var updateAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        updateAction.identifier = "UPDATE_ACTION"
        updateAction.title = "Update"
        
        var noAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        noAction.identifier = "NO_ACTION"
        noAction.destructive = true
        noAction.title = "Later"
        
        updateAction.activationMode = UIUserNotificationActivationMode.Foreground
        updateAction.authenticationRequired = true
        noAction.activationMode = UIUserNotificationActivationMode.Background
        noAction.authenticationRequired = true
        
        var updateCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        updateCategory.identifier = "UPDATE"
        
        let defaultActions:NSArray = [updateAction,noAction]
        let minimalActions:NSArray = [updateAction,noAction]
        
        updateCategory.setActions(defaultActions, forContext: UIUserNotificationActionContext.Default)
        updateCategory.setActions(minimalActions, forContext: UIUserNotificationActionContext.Minimal)
        
        // NSSet of all our categories
        
        let categories:NSSet = NSSet(objects: updateCategory)
        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        PushAppsManager.sharedInstance().startPushAppsWithAppToken("cad9d54b-97f1-4c8c-969f-bb49f2a4f961", withLaunchOptions: launchOptions)
        Flurry.startSession("SYN9YNB65VQVVJXPYVPZ")
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
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
    
    // Push Notification
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        NSLog("Registered Settings!")
        PushAppsManager.sharedInstance().didRegisterUserNotificationSettings(notificationSettings);
        
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        NSLog("RemoteNotification!")
        PushAppsManager.sharedInstance().handleActionWithIdentifier(identifier, forRemoteNotification: userInfo, completionHandler: completionHandler);
        if(identifier == "UPDATE_ACTION"){
            NSLog("UPDATE!")
            dispatch_async(dispatch_get_main_queue()){
                var url = NSURL(string: "https://www.codepixl.net/mathhelper?update=true")
                UIApplication.sharedApplication().openURL(url!)
            }
        }
        completionHandler()
        
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        NSLog("Device Token! "+deviceToken.description)
        PushAppsManager.sharedInstance().updatePushToken(deviceToken);
        
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        NSLog("RecievedRemoteNotification!")
        PushAppsManager.sharedInstance().handlePushMessageOnForeground(userInfo);
        NSLog(userInfo.description)
        
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        NSLog("Failed to register!")
        NSLog(error.localizedDescription)
        PushAppsManager.sharedInstance().updatePushError(error);
        
    }
}