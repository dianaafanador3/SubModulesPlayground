//
//  RealmSupport.swift
//  RealmSupport
//
//  Created by Diana Maria Perez Afanador on 7/7/22.
//

import RealmSwift

//public class TestSupportObject: Object {
//    @Persisted(primaryKey: true) var id: String = ObjectId.generate().stringValue
//    @Persisted public var name: String
//
//    convenience init(name: String) {
//        self.init()
//        self.name = name
//    }
//}
//
//public class RealmSupport {
//    public static func save() throws {
//        let realm = try Realm()
//        try realm.write {
//            let testObject = TestSupportObject(name: "Maria")
//            realm.add(testObject)
//        }
//    }
//
//    public static func search() throws -> TestSupportObject {
//        let realm = try Realm()
//        return realm.objects(TestSupportObject.self).first!
//    }
//
//    public static func readName() throws -> String {
//        let realm = try Realm()
//        let object = realm.objects(TestSupportObject.self).first!
//        let foundObject = realm.object(ofType: TestSupportObject.self, forPrimaryKey: object.id)!
//        return foundObject.name
//    }
//}
//
