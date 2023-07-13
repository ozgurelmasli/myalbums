//
//  AlbumListViewModelTests.swift
//  myalbumsTests
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import XCTest
@testable import myalbums

final class AlbumListViewModelTests: XCTestCase {
    
    private var mockNetwork: MockNetwork!
    private var sut: AlbumListViewModel!
    private var mockView: MockView!
    
    override func setUpWithError() throws {
        mockView = MockView()
        mockNetwork = MockNetwork()
        sut  = AlbumListViewModel(network: mockNetwork)
        sut.view = mockView
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockView = nil
        mockNetwork = nil
    }
    
    func test_view_did_load_should_request_network() {
        // Setup
        mockNetwork.mockData = try? getMockData(.albumsResponse)
        
        // Execute
        sut.viewDidLoad()
        // Verify
        let exp = expectation(description: "viewDidLoad should call request func")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        
        if result == .timedOut {
            XCTAssertTrue(self.mockNetwork.isRequestCalled)
            XCTAssertEqual(self.mockNetwork.requestCallCount, 1)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_view_did_load_should_return_album_list_successfully() {
        // Setup
        mockNetwork.mockData = try? getMockData(.albumsResponse)
        
        // Execute
        sut.viewDidLoad()
        
        // Verify
        let exp = expectation(description: "network request should return fully list")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        
        if result == .timedOut {
            XCTAssertFalse(self.sut.dataSource.rows.isEmpty)
            XCTAssertEqual(self.sut.dataSource.rows.count, 100)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_view_did_load_should_call_reload() {
        // Setup
        mockNetwork.mockData = try? getMockData(.albumsResponse)
        
        // Execute
        sut.viewDidLoad()
    
        // Verify
        let expectation = XCTestExpectation(description: "After network sent fully list, reload func should call")
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue(self.mockView.isReloadUICalled)
        XCTAssertEqual(self.mockView.reloadUICallCount, 1)
    }
    
    func test_view_did_load_should_change_loading_state() {
        // Setup
        mockNetwork.mockData = try? getMockData(.albumsResponse)
        
        // Execute
        sut.viewDidLoad()
        
        // Verify
        XCTAssertTrue(mockView.isStartLoadingCalled)
        XCTAssertEqual(mockView.startLoadingCallCount, 1)
        
        // Verify
        let expectation = XCTestExpectation(description: "should loading state change while network start and end")
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue(self.mockView.isStopLoadingCalled)
        XCTAssertEqual(self.mockView.stopLoadingCallCount, 1)
    }
    
    func test_view_did_load_should_call_error_state() {
        // Setup
        mockNetwork.error = .somethingWentWrong
        
        // Execute
        sut.viewDidLoad()
        
        // Verify
        let expectation = XCTestExpectation(description: "error UI show func should call after catch error")
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue(self.mockView.isResultCalled)
        XCTAssertEqual(self.mockView.resultCallCount, 1)
        XCTAssertEqual(self.mockView.resultMessage, .stringResources.core_something_went_wrong_error_message())
    }
    
    func test_did_select_handler_should_call_navigate() {
        // Setup
        mockNetwork.mockData = try? getMockData(.albumsResponse)
        let indexPath: IndexPath = .init(row: 0, section: 1)
        
        // Execute
        sut.viewDidLoad()
        
        // Verify
        let exp = expectation(description: "network request should return fully list")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        
        if result == .timedOut {
            XCTAssertFalse(self.sut.dataSource.rows.isEmpty)
            XCTAssertEqual(self.sut.dataSource.rows.count, 100)
            
            // Execute
            sut.dataSource.didSelectHandler?(indexPath)
            
            // Verify
            let expectation = XCTestExpectation(description: "navigation func should call after didSelectAction")
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 3.0)
            
            XCTAssertTrue(self.mockView.isNavigationCalled)
            XCTAssertEqual(self.mockView.navigationCallCount, 1)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}

private class MockView: AlbumListDisplayLayer {
    
    var isStartLoadingCalled: Bool = false
    var startLoadingCallCount: Int = 0
    
    var isStopLoadingCalled: Bool = false
    var stopLoadingCallCount: Int = 0
    
    var isNavigationCalled: Bool = false
    var navigationCallCount: Int = 0
    
    var isResultCalled: Bool = false
    var resultMessage: String = ""
    var resultCallCount: Int = 0
    
    var isReloadUICalled: Bool = false
    var reloadUICallCount: Int = 0
    
    func startLoading() {
        isStartLoadingCalled = true
        startLoadingCallCount += 1
    }
    
    func stopLoading() {
        isStopLoadingCalled = true
        stopLoadingCallCount += 1
    }
    
    func navigateTo(_ controller: UIViewController) {
        isNavigationCalled = true
        navigationCallCount += 1
    }
    
    func showResult(title: String, message: String, buttonTitle: String?, actionHandler: myalbums.VoidHandler?) {
        isResultCalled = true
        resultCallCount += 1
        resultMessage = message
    }
    
    func reloadUI() {
        isReloadUICalled = true
        reloadUICallCount += 1
    }
}
