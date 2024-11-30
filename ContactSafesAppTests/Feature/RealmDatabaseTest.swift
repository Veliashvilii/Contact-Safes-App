//
//  RealmDatabaseTest.swift
//  ContactSafesAppTests
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import XCTest
@testable import ContactSafesApp
import RealmSwift

internal class TestObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    
    var idValue: String {
        return id.stringValue
    }
}

final class RealmDatabaseTest: XCTestCase {
    
    var realmDatabase: RealmDatabase!
    
    override func setUp() {
        super.setUp()
        realmDatabase = RealmDatabase(
            inMemoryIdentifier:  "TestableRealm",
            objects: [TestObject.self]
        )
    }
    
    func testAddItem() {
        let testObject = TestObject()
        testObject.name = "Metehan Belli"
        
        realmDatabase.add(model: testObject)
        
        let items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Metehan Belli")
    }
    
    func testDeleteItem() {
        let testObject = TestObject()
        testObject.name = "Metehan Belli"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Metehan Belli")
        
        realmDatabase.delete(model: testObject)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
    
    func clearAll() {
        let testObject = TestObject()
        testObject.name = "Metehan Belli"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Metehan Belli")
        
        realmDatabase.clearAll(model: TestObject.self)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
    
    func deleteFromId() {
        let testObject = TestObject()
        testObject.name = "Metehan Belli"
        
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Metehan Belli")
        
        realmDatabase.deleteFromId(model: TestObject.self, id: items.first!.idValue)
        
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }

}
