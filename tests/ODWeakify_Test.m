//
//  ODPath_Test.m
//  ODXCore
//
//  Created by Alex Nazaroff on 15.06.16.
//  Copyright © 2016 AJR. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ODXCore.h"

@interface ODWeakify_Test : XCTestCase
@end

@implementation ODWeakify_Test

- (void)testWeakify {
    od_weakify(self);
    XCTAssert(self);
    XCTAssert(self_weak_);
    XCTAssert(self_weak_ == self);
    XCTAssert(&self_weak_ != &self);
}

- (void)testStrongify {
    od_weakify(self);

    __strong ODWeakify_Test **orig = &self;
    do {
        od_strongify(self);
        XCTAssert(self);
        XCTAssert(orig);

        XCTAssert(*orig == self);
        XCTAssert(&orig != &self);
    } while(0);

}

@end