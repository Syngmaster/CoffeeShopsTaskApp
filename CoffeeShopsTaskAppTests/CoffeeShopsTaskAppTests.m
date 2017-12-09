//
//  CoffeeShopsTaskAppTests.m
//  CoffeeShopsTaskAppTests
//
//  Created by Syngmaster on 06/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMServerManager.h"
#import "SMCoffeeShopModel.h"
#import "SMDetailsViewController.h"

@interface CoffeeShopsTaskAppTests : XCTestCase

@property (strong, nonatomic) SMDetailsViewController *detailsVCUnderTest;
@property (strong, nonatomic) SMServerManager *manager;
@property (strong, nonatomic) NSString *mockShopID;

@end

@implementation CoffeeShopsTaskAppTests

- (void)setUp {
    [super setUp];
    
    self.manager = [SMServerManager sharedManager];
    self.mockShopID = @"shopID";
    
    //*** setting up SMDetailsViewController
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.detailsVCUnderTest = [storyboard instantiateViewControllerWithIdentifier:@"SMDetailsViewController"];
    NSDictionary *mockShopModelDict = @{@"id":@"shopID",@"name":@"shopName",@"formattedAddress":@"shopAddress"};
    self.detailsVCUnderTest.selectedShop = [[SMCoffeeShopModel alloc] initWithDictionary:mockShopModelDict];
    [self.detailsVCUnderTest loadView];
    [self.detailsVCUnderTest viewDidLoad];
    [self.detailsVCUnderTest viewDidAppear:YES];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReviewsTableViewEstimatedHeightForRow {
    XCTAssertEqual(self.detailsVCUnderTest.reviewsTableView.estimatedRowHeight, 60);
}

- (void)testDetailsViewControllerNavigationItemTitle {
    XCTAssertNotNil(self.detailsVCUnderTest.navigationItem.title);
}

- (void)testServiceManagerReturnsSameInstance {
    SMServerManager *newInstance = [SMServerManager sharedManager];
    XCTAssertEqual(newInstance, self.manager);
}

- (void)testServerManagerGetListsMethodOutput {
  
    XCTestExpectation *expectation = [self expectationWithDescription:@"Query timeout"];

    [self.manager getListOfCoffeeShopsOnComplete:^(NSArray *resultArray, NSError *error) {
        
        if (resultArray) {
            XCTAssertNil(error);
        } else {
            XCTAssertNil(resultArray);
        }
        
        [expectation fulfill];

    }];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
    
}

- (void)testServerManagerDetailsMethodOutput {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Query timeout"];

    [self.manager getDetailsOfCoffeeShop:self.mockShopID onCompletion:^(SMCoffeeShopDetailsModel *shopDetails, NSError *error) {
        
        if (shopDetails) {
            XCTAssertNil(error);
        } else {
            XCTAssertNil(shopDetails);
        }
        [expectation fulfill];

    }];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
