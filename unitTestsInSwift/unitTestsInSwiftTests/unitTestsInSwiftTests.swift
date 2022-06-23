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
    
    
    
    func testClass_TrueFalse_ThrowsException() {
        
        XCTAssertThrowsError(try unitTest.trueFalse(m_value: -1))
        XCTAssertEqual(try unitTest.trueFalse(m_value: 1), true)
        XCTAssertEqual(try unitTest.trueFalse(m_value: 0), false)
    }
    
    func testClass_MultiplyFunction() {
        XCTAssertEqual(2 * 2, unitTest.multiply(m_value1: 2, m_value2: 2))
    }
    
    func testClass_SumFunction() {
        XCTAssertEqual(2 + 2, unitTest.sum(m_value1: 2, m_value2: 2))
    }
    
    func testClass_DivideFunction() {
        XCTAssertEqual(2 / 2, unitTest.divide(m_value1: 2, m_value2: 2))
    }
    
    func testClass_MinusFunction() {
        XCTAssertEqual(2 - 2, unitTest.minus(m_value1: 2, m_value2: 2))
    }

    // метод самого теста
    func testExample() throws {
      
    }
    
    // метод тестирования скорости выполнения определённого блока кода
    func testPerformanceExample() throws {
        // Це приклад тесту продуктивності.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
