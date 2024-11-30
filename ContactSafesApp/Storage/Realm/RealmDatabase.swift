//
//  RealmDatabase.swift
//  Contact Safes App
//
//  Created by Metehan Veliashvili on 30.11.2024.
//

import Foundation
import RealmSwift

final class RealmDatabase: LocalDatabaseProtocol {
    private let realm: Realm
    init(inMemoryIdentifier: String? = nil, objects: [Object.Type]? = nil) {
        let configuration = Realm.Configuration(
            inMemoryIdentifier: inMemoryIdentifier,
            deleteRealmIfMigrationNeeded: true,
            objectTypes: objects
        )
        guard let realm = try? Realm(configuration: configuration) else {
            fatalError("Realm could not created!")
        }
        self.realm = realm
    }
    func add<T>(model: T) where T: Object {
        try? realm.write({
            realm.add(model)
        })
    }
    func clearAll<T>(model: T.Type) where T: Object {
        try? realm.write {
            realm.deleteAll()
        }
    }
    func items<T>() -> [T] where T: Object {
        return realm.objects(T.self).map { $0 }
    }
    func delete<T>(model: T) where T: Object {
        try? realm.write({
            realm.delete(model)
        })
    }
    func deleteFromId<T>(model: T.Type, id: String) where T: Object {
        guard let objectId = try? ObjectId(string: id) else { return }
        let item = realm.objects(model.self).filter("_id == %@", objectId)
        try? realm.write({
            realm.delete(item)
        })
    }
}
