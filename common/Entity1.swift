import Foundation
import CoreData

@objc(Entity1) class Entity1 : NSManagedObject {
    
    @NSManaged var updatedCount: Int16
    @NSManaged var createdBy: String
    @NSManaged var createdAt: NSDate
    @NSManaged var sibblings: NSSet
    
    func description() -> String {
        return "\(createdBy) : \(createdAt) -- \(updatedCount) updates -- \(sibblings.count) sibblings"
    }
        
    class func create(ctx:NSManagedObjectContext, by:String) -> Entity1 {
        var entity = NSEntityDescription.insertNewObjectForEntityForName("Entity1", inManagedObjectContext:ctx) as Entity1
        entity.createdBy = by
        entity.createdAt = NSDate()
        println("+++ Created \(entity.description)")
        return entity
    }
    
}