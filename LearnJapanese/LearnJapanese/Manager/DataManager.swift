//
//  DataManager.swift
//  ToDoList
//
//  Created by iem on 30/03/2018.
//  Copyright © 2018 iem. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    
    enum SortParam: String{
        case alphabeticFR = "motFR"
        case none
    }
    
    var cachedWords: [Word]
    
    var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var dataFileUrl: URL {
        return documentDirectory.appendingPathComponent("Words").appendingPathExtension("json")
    }
    
    var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static let sharedInstance = DataManager()
    private init(){
        cachedWords = []
    }

    func saveWords(){
        saveContext()
    }
    
    func addWord(motFR: String, motJPKana: String, motJPKanji: String, motJPRomaji: String){
        let word = Word(context: persistentContainer.viewContext)
        word.motFR = motFR
        word.motJPKana = motJPKana
        word.motJPKanji = motJPKanji
        word.motJPRomaji = motJPRomaji
        self.cachedWords.append(word)
        self.sort(byParams: .alphabeticFR, forElements: cachedWords)
        saveWords()
    }
    
    func deleteWord(word: Word){
        context.delete(word)
        saveWords()
    }
    
    func loadWords(){
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        do {
           cachedWords = try context.fetch(fetchRequest)
           self.sort(byParams: .alphabeticFR,forElements: cachedWords)
        
        } catch {
            debugPrint("Could not noad the item from Core Data")
        }
    }
    
    func filterWords(textToFind: String) -> [Word]{
        
        var words: [Word]! = nil
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        
        if textToFind.count > 0 {
            let predicate = NSPredicate(format: "name contains[cd] %@", textToFind)
            fetchRequest.predicate = predicate
        }
        
        do {
            words = try context.fetch(fetchRequest)
        } catch {
            debugPrint("Could not load words from Core Data")
        }
        
        return words
    }
    
    
    func sort(byParams params : SortParam = .none, forElements cachedData: Any){
        let sortDescriptors: NSSortDescriptor
        if let array = cachedData as? [Word]{
            let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
            switch params {
            case .alphabeticFR:
                sortDescriptors = NSSortDescriptor(key: "motFR", ascending: true, selector: #selector(NSString.caseInsensitiveCompare))
                fetchRequest.sortDescriptors = [sortDescriptors]
            case .none:
                print("pas de tri")
            }
            do {
                cachedWords = try context.fetch(fetchRequest)
            } catch {
                debugPrint("Could not load words from Core Data")
            }
        }
        
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Words")
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
