//
//  OCShowCollectionTests.m
//  OCShowCollectionTests
//
//  Created by Greg Tarsa on 1/29/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FishCard.h"

@interface OCShowCollectionTests : XCTestCase

@end

@implementation OCShowCollectionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    FishCard *exampleCard = [FishCard newWithRank:@"3" suit:@"H"];
    XCTAssertEqualObjects([exampleCard toFileBaseName], @"h3", @"Card image name should be created with abbrevs.");
}

@end
