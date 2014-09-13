

import CoreData

class ModelManager {

    var ctx: NSManagedObjectContext
    var from: String
    
    init(ctx: NSManagedObjectContext, persistentStoreCoordinator: NSPersistentStoreCoordinator, from:String){
        println("ModelManager init ...")
        self.ctx = ctx
        self.from = from
        
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreCoordinatorStoresWillChangeNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreCoordinatorStoresWillChangeNotification \(notif)")
        })
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreCoordinatorStoresDidChangeNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreCoordinatorStoresDidChangeNotification \(notif)")
        })
        NSNotificationCenter.defaultCenter().addObserverForName(NSPersistentStoreDidImportUbiquitousContentChangesNotification,
            object: persistentStoreCoordinator,
            queue: NSOperationQueue.mainQueue(),
            usingBlock:{ (notif: NSNotification!) -> Void in
                println("NSPersistentStoreDidImportUbiquitousContentChangesNotification \(notif)")
        })

        println("ModelManager init done!")
    }
    
    func entitiesAsString() -> String {
        var anyError: NSError?
        let req = NSFetchRequest(entityName: "Entity1")
        let all: NSArray! = ctx.executeFetchRequest(req, error:&anyError)
        var log = "Existing Entity1 count: \(all.count)"
        for e in all {
            log += "\n  \(e.description)"
        }
        return log
    }
    
    func createEntity1() {
        var anyError: NSError?
        // Insert code here to initialize your application
        Entity1.create(ctx, by: from)
        if !ctx.save(&anyError) {
            println("Cannot save on create: \(anyError!.localizedDescription)")
            println("   userInfo: \(anyError!.userInfo)")
        }
    }
    
    func updateLastEntity(){
        var anyError: NSError?
        let req = NSFetchRequest(entityName: "Entity1")
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending:false)]
        req.predicate = NSPredicate(format:"from = \(from)")
        let all: NSArray! = ctx.executeFetchRequest(req, error:&anyError)
        if (all.count > 0) {
            var e = all[0] as Entity1
            e.updatedCount += 1
        }
        if !ctx.save(&anyError) {
            println("Cannot save on updateLastEntity: \(anyError!.localizedDescription)")
            println("   userInfo: \(anyError!.userInfo)")
        }
    }
}
