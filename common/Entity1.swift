import Foundation
import CoreData

@objc(Entity1) class Entity1 : NSManagedObject {
    
    @NSManaged var updatedCount: Int16
    @NSManaged var createdBy: String
    @NSManaged var createdAt: NSDate
    
    func description() -> String {
        return "SharedEntity: Created by \(createdBy) at \(createdAt), updated \(updatedCount) times"
    }
        
    class func create(ctx:NSManagedObjectContext, by:String) -> Entity1 {
        var entity = NSEntityDescription.insertNewObjectForEntityForName("Entity1", inManagedObjectContext:ctx) as Entity1
        entity.createdBy = by
        entity.createdAt = NSDate()
        println("+++ Created \(entity.description)")
        return entity
    }
    
}