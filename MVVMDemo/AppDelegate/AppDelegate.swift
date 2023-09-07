//
//  AppDelegate.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Example usage:
        let numbers = [5, 1, 2, 3, 4, 2, 3, 5, 4, 6, 1]
        if let lastUniqueNumber = findLastUniqueNumber(numbers) {
            print("Last unique number is: \(lastUniqueNumber)")
        } else {
            print("There is no unique number in the array.")
        }
        return true
    }
    func findLastUniqueNumber(_ numbers: [Int]) -> Int? {
        var frequencyDict: [Int: Int] = [:]

        // Count the frequency of each number in the array
        for number in numbers {
            frequencyDict[number, default: 0] += 1
        }
        print("frequencyDict: \(frequencyDict)")
        // Iterate through the array in reverse to find the last unique number
        for number in numbers.reversed() {
            if let frequency = frequencyDict[number], frequency == 1 {
                return number
            }
        }

        return nil // If there's no unique number
    }

   


    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MVVMDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

