//
//  Copyright © 2015-2022 Alexey Nazarov. All rights reserved.
//

@import XCTest;
@import ODWeakify;

@interface ODWeakify_Test : XCTestCase
@end

@implementation ODWeakify_Test

- (void)testWeakify {
    od_weakify(self);
    XCTAssert(self);
    XCTAssert(self_weak_);
    XCTAssert(self_weak_ == self);
    XCTAssert(&self_weak_ != &self);

    NSObject *obj = [NSObject new];
    od_weakify(obj);
    XCTAssert(obj_weak_);
}

- (void)testStrongify {
    od_weakify(self);

    __strong ODWeakify_Test * const *orig = &self;
    do {
        od_strongify(self);
        XCTAssert(self);
        XCTAssert(orig);

        XCTAssert(*orig == self);
        XCTAssert(orig != &self);
    } while(0);

    NSObject *obj = [NSObject new];
    od_weakify(obj);

    {
        od_strongify(obj);
        XCTAssert(obj);
    }
}

- (void)testBlockWeak {
    void (^block)() = block_weak(self, {
        XCTAssert(self);
        XCTAssert(self_weak_);
        XCTAssert(self_weak_ == self);
        XCTAssert(&self_weak_ != &self);
    });
    block();
}

@end
