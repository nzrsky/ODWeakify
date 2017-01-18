//
//  ViewController.m
//  Weakify
//
//  Created by Alexey Nazaroff on 01/06/2017.
//  Copyright (c) 2017 Alexey Nazaroff. All rights reserved.
//

@import UIKit;
#import <ODWeakify.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) void (^block)();
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    od_weakify(self);
    od_weakify(application);

    self.block = ^{
        od_strongify(self);
        NSLog(@"%@", self);
        NSLog(@"%@", application_weak_);
    };

    // application.anyBlock = ^{ app_weak_.something = .. }

    self.block();

    return YES;
}

@end
