//
//  LocalDatabase.swift
//  Contact Safes App
//
//  Created by Metehan Veliashvili on 30.11.2024.
//

import RealmSwift

protocol LocalDatabaseProtocol {
    func add<T: Object>(model: T)
    func clearAll<T: Object>(model: T.Type)
    func items<T: Object>() -> [T]
    func delete<T: Object>(model: T)
    func deleteFromId<T: Object>(model: T.Type, id: String)
}
