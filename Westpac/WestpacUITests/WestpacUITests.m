//
//  WestpacUITests.m
//  WestpacUITests
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface WestpacUITests : XCTestCase{

XCUIApplication *app;
}
@end

@implementation WestpacUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.

    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    app = [[XCUIApplication alloc] init];
    [app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

-(void) testUi{
    XCUIElement *lblTemperature = app.staticTexts[@"lblTemperature"];
    XCUIElement *lblSummary = app.staticTexts[@"lblSummary"];
    XCUIElement *pickerView = app.pickers[@"pickerView"];
    
    XCTAssertTrue(lblTemperature.label.length, @"lblTemperature should contain a string");

    [pickerView swipeRight];
    

    XCTAssertFalse(lblSummary.label.length, @"lblSummary should contain a string");
}



- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
