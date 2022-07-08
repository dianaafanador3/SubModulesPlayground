//
//  RealmWrapper.swift
//  RealmWrapper
//
//  Created by Diana Maria Perez Afanador on 5/7/22.
//

import RealmSwift

let appId = "testappdiana-drmda"
let app = RealmSwift.App(id: appId)

public class Dog: Object {
    @Persisted(primaryKey: true) var _id: String = ObjectId.generate().stringValue
    @Persisted public var name: String
    @Persisted public var age: Int

    convenience init(name: String, age: Int) {
        self.init()
        self.name = name
        self.age = age
    }
}

public class RealmWrapper {
    public static func handleError() async throws {
        app.syncManager.errorHandler = { (error, _) in
            if let error = error as? SyncError {
                let (_, errorToken) = error.clientResetInfo()!
                SyncSession.immediatelyHandleError(errorToken, syncManager: app.syncManager)
            }
        }
        let user = try await app.login(credentials: .anonymous)
        do {
            let realm = try await Realm(configuration: user.configuration(partitionValue: "myPartition"))
            let count = realm.objects(Dog.self).count
            print(count)
        } catch {
            print(error)
        }
    }

    public static func save() throws {
        let realm = try Realm()
        try realm.write {
            let testObject = Dog(name: "Tomas", age: 6)
            realm.add(testObject)
        }
    }

    public static func search() throws -> Dog {
        let realm = try Realm()
        return realm.objects(Dog.self).first!
    }
}
