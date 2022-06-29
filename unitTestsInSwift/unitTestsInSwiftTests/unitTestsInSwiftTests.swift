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
    
    func testClassTestError_ReturnsAnError_ThrowsException() throws {
        
        XCTAssertThrowsError(try unitTest.trueFalse(m_value: -1)) { error in
            XCTAssertEqual(error as? classTestError, classTestError.tetsThrows)
        }
    }
    
    func testTrueFalse_ValueEqualOne_ReturnTrue() {
        XCTAssertEqual(try unitTest.trueFalse(m_value: 1), true)
    }
    
    func testTrueFalse_ValueEqualZero_ReturnFalse()  {
        XCTAssertEqual(try unitTest.trueFalse(m_value: 0), false)
    }
    
    func testTrueFalse_ValueLessThanOne_ThrowsException() throws {
        
        XCTAssertThrowsError(try unitTest.trueFalse(m_value: -1))
    }
    
    func testMultiply_MultiplyValues_ResultOfMultiplication() {
        XCTAssertEqual(2 * 2, unitTest.multiply(m_value1: 2, m_value2: 2))
    }
    
    func testSum_SumValues_ResultOfSum() {
        XCTAssertEqual(2 + 2, unitTest.sum(m_value1: 2, m_value2: 2))
    }
    
    func testDivide_DivideValues_ResultOfDivide() {
        XCTAssertEqual(2 / 2, unitTest.divide(m_value1: 2, m_value2: 2))
    }
    
    func testMinus_MinusValues_ResultOfMinus() {
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
