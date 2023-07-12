//
//  AlbumListUITests.swift
//  myalbumsUITests
//
//  Created by Özgür Elmaslı on 12.07.2023.
//

import XCTest

final class AlbumListUITests: XCTestCase {

    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app = XCUIApplication.init()
    }
    
    func test_loading_view_should_not_exists() {
        app.launch()
        
        let loadingView = app.otherElements["LoadingViewIdentifier"]
        
        expectation(for: NSPredicate(format: "exists == 0"), evaluatedWith: loadingView, handler: nil)
     
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_success_case_view_should_tableView_exists() {
        app.launch()
        
        let tableView = app.tables["albumListIdentifier"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: tableView, handler: nil)
     
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotEqual(tableView.cells.count, 0)
    }
    
    func test_view_should_tableView_not_exists_after_cell_tap() {
        app.launch()
        
        let tableView = app.tables["albumListIdentifier"]
        
        tableView.cells.firstMatch.tap()
        
        expectation(for: NSPredicate(format: "exists == 0"), evaluatedWith: tableView, handler: nil)
     
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_success_case_view_should_filter_button_exists() {
        app.launch()
        
        let button = app.buttons["filterButtonIdentifier"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: button, handler: nil)
     
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_view_should_show_filtered_users_table_exists() {
        app.launch()
        
        let button = app.buttons["filterButtonIdentifier"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: button, handler: nil)
        
        waitForExpectations(timeout: 5, handler: { [weak self] error in
            if error != nil { XCTFail("Tableview not found")}
            
            button.tap()
            
            let tableView = self?.app.tables["filterTableViewIdentifier"]
            
            self?.expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: tableView, handler: nil)
         
            self?.waitForExpectations(timeout: 5, handler: nil)
            
            XCTAssertNotEqual(tableView?.cells.count, 0)
        })
    }
    
    func test_view_should_dismiss_after_filtered_users_table_select() {
        app.launch()
        
        let button = app.buttons["filterButtonIdentifier"]
        
        button.tap()
        
        let tableView = app.tables["filterTableViewIdentifier"]
        
        tableView.cells.firstMatch.tap()
        
        expectation(for: NSPredicate(format: "exists == 0"), evaluatedWith: tableView, handler: nil)
     
        waitForExpectations(timeout: 5, handler: nil)
    }
}
