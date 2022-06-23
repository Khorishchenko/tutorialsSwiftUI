//
//  unitTestsInSwiftTests.swift
//  unitTestsInSwiftTests
//
//  Created by user on 22.06.2022.
//

import XCTest
@testable import unitTestsInSwift

class unitTestsInSwiftTests: XCTestCase {

    // создаём объект, который будем использовать в тестах
    var unitTest = UnitTest()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // в данном методе, который запускается перед началом тестов, инициируем объект в виде класа, что позволит нам обращаться к его свойствам и методам
        unitTest = UnitTest()
    }

    override func tearDownWithError() throws {
        // убираем объект из памяти после окончания теста, освобождая память для запуска следующих тестов
        
        try super.tearDownWithError()
    }

    
    // метод самого теста
    func testExample() throws {
      
        XCTAssertEqual(2 + 2, unitTest.sum(a: 2, b: 2))
        XCTAssertEqual(2 * 2, unitTest.multiply(a: 2, b: 2))
        XCTAssertEqual(2 / 2, unitTest.divide(a: 2, b: 2))
        XCTAssertEqual(2 - 2, unitTest.minus(a: 2, b: 2))
    }
    
    
    // метод тестирования скорости выполнения определённого блока кода
    func testPerformanceExample() throws {
        // Це приклад тесту продуктивності.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
