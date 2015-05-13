//
//  AppDelegate.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit
import CoreData

var test = 1

@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
           //println("Not first launch.")
            
            
            retrieveCharges()
            retrieveChargesDates()
            retrievePeriodCharges()
            retrieveEmployeeDict()
            retrievePeriodEmployeeDict()
            retrieveEmployees()
            retrieveReferenceDate()
            retrievePeriodStartDates()
            retrievePeriodEndDates()
            
       }
        else {
            //println("First launch, setting NSUserDefault.")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            
            
            updateChargeDates()
            updateCharges()
            updatePeriodCharges()
            updateEmployeeDict()
            updatePeriodEmployeeDict()
            updateEmployees()
            updateReferenceDate()
            updatePeriodStartDates()
            updatePeriodEndDates()
            
        
            
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound | UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
            
        
        let nowDate = NSDate()
        
        
        
        let flags: NSCalendarUnit = NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear
        
        let referenceComponents = NSDateComponents()
        let firstNotificationComponents = NSDateComponents()
        let sixteenNotificationComponents = NSDateComponents()
        let referenceEndComponents = NSDateComponents()
        
        
        let nowComponents = NSCalendar.currentCalendar().components(flags, fromDate: nowDate)
        
        let nowDay = nowComponents.day
        let nowMonth = nowComponents.month
        let nowYear = nowComponents.year
        
        
        
        if nowDay >= 1 && nowDay < 16{
            
            referenceComponents.day = 1
            referenceComponents.month = nowComponents.month
            referenceComponents.year = nowComponents.year
            referenceComponents.hour = 0
            referenceComponents.minute = 1
            referenceComponents.second = 0
            referenceComponents.timeZone = NSTimeZone.localTimeZone()
            
            sixteenNotificationComponents.day = 16
            sixteenNotificationComponents.month = nowComponents.month
            sixteenNotificationComponents.year = nowComponents.year
            sixteenNotificationComponents.hour = 0
            sixteenNotificationComponents.minute = 2
            sixteenNotificationComponents.second = 0
            sixteenNotificationComponents.timeZone = NSTimeZone.localTimeZone()
            
            firstNotificationComponents.day = 1
            if nowMonth == 12{
                firstNotificationComponents.month = 1
            }else{
            firstNotificationComponents.month = nowComponents.month + 1
            }
            if nowComponents.month == 12{
                firstNotificationComponents.year = nowComponents.year + 1
            }else{
                firstNotificationComponents.year = nowComponents.year
            }
            firstNotificationComponents.hour = 0
            firstNotificationComponents.minute = 2
            firstNotificationComponents.second = 0
            firstNotificationComponents.timeZone = NSTimeZone.localTimeZone()
            
            
            
        }else{
            
            referenceComponents.day = 16
            referenceComponents.month = nowComponents.month
            referenceComponents.year = nowComponents.year
            referenceComponents.hour = 0
            referenceComponents.minute = 1
            referenceComponents.second = 0
            referenceComponents.timeZone = NSTimeZone.localTimeZone()
            
            firstNotificationComponents.day = 1
            if nowMonth == 12{
            firstNotificationComponents.month = 1
            }else{
            firstNotificationComponents.month = nowComponents.month + 1
            }
            if nowComponents.month == 12{
            firstNotificationComponents.year = nowComponents.year + 1
            }else{
            firstNotificationComponents.year = nowComponents.year
            }
            firstNotificationComponents.hour = 0
            firstNotificationComponents.minute = 2
            firstNotificationComponents.second = 0
            firstNotificationComponents.timeZone = NSTimeZone.localTimeZone()
            
            sixteenNotificationComponents.day = 16
            if nowMonth == 12{
            sixteenNotificationComponents.month = 1
            sixteenNotificationComponents.year = nowComponents.year + 1
            }else{
            sixteenNotificationComponents.month = nowComponents.month + 1
            sixteenNotificationComponents.year = nowYear
            }
            sixteenNotificationComponents.hour = 0
            sixteenNotificationComponents.minute = 2
            sixteenNotificationComponents.second = 0
            sixteenNotificationComponents.timeZone = NSTimeZone.localTimeZone()
            
        }
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        referenceDate = calendar!.dateFromComponents(referenceComponents)!
        let firstNotificationDate = calendar!.dateFromComponents(firstNotificationComponents)!
        let sixteenNotificationDate = calendar!.dateFromComponents(sixteenNotificationComponents)!
            
        periodStartDates.append(referenceDate)
            
            if referenceComponents.day == 1{
               
                referenceEndComponents.day = 16
                referenceEndComponents.month = referenceComponents.month
                referenceEndComponents.year = referenceComponents.year
                referenceEndComponents.hour = 0
                referenceEndComponents.minute = 0
                referenceEndComponents.second = 0
                referenceEndComponents.timeZone = NSTimeZone.localTimeZone()
                
            }else{
                referenceEndComponents.day = 1
                if referenceComponents.month == 12{
                referenceEndComponents.month = 1
                referenceEndComponents.year = referenceComponents.year + 1
                }else{
                referenceEndComponents.month = referenceComponents.month + 1
                referenceEndComponents.year = referenceComponents.year
                }
                referenceEndComponents.hour = 0
                referenceEndComponents.minute = 0
                referenceEndComponents.second = 0
                referenceEndComponents.timeZone = NSTimeZone.localTimeZone()
                
            }
            
            let referenceEndDate = calendar!.dateFromComponents(referenceEndComponents)!
            
            periodEndDates.append(referenceEndDate)
            
            
            
            
            var localNotificationFirst:UILocalNotification = UILocalNotification()
            localNotificationFirst.alertAction = "Okay"
            localNotificationFirst.alertBody = "Period data needs to be emailed"
            localNotificationFirst.fireDate = firstNotificationDate
            localNotificationFirst.repeatInterval = NSCalendarUnit.CalendarUnitMonth
            UIApplication.sharedApplication().scheduleLocalNotification(localNotificationFirst)
            
            var localNotificationSixteen:UILocalNotification = UILocalNotification()
            localNotificationSixteen.alertAction = "Okay"
            localNotificationSixteen.alertBody = "Period data needs to be emailed"
            localNotificationSixteen.fireDate = sixteenNotificationDate
            localNotificationFirst.repeatInterval = NSCalendarUnit.CalendarUnitMonth
            UIApplication.sharedApplication().scheduleLocalNotification(localNotificationSixteen)
            
            /*
            println("Reference Date is \(referenceDate)")
            println("Reference End Date is \(referenceEndDate)")
            println("First Notification Date is \(firstNotificationDate)")
            println("Sixteen Notification Date is \(sixteenNotificationDate)")
        */
       }
        
        
        
        
        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
       checkForNewPeriod()
        
       //implement email code here. Reporting period is periodStartDates[periodStartDates.count - 2]
        
        test = 0
        
        println("The value of test is \(test)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        
        updateChargeDates()
        updateCharges()
        updatePeriodCharges()
        updateEmployeeDict()
        updatePeriodEmployeeDict()
        updateEmployees()
        updateReferenceDate()
        updatePeriodStartDates()
        updatePeriodEndDates()

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
        
        
        updateChargeDates()
        updateCharges()
        updatePeriodCharges()
        updateEmployeeDict()
        updatePeriodEmployeeDict()
        updateEmployees()
        updateReferenceDate()
        updatePeriodStartDates()
        updatePeriodEndDates()
        
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.LaifHarwood.Employee_Snacks_2" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Employee_Snacks_2", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("Employee_Snacks_2.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}

