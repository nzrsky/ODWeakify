# ODWeakify

[![Version](https://img.shields.io/cocoapods/v/ODWeakify.svg?style=flat)](http://cocoapods.org/pods/ODWeakify)
[![License](https://img.shields.io/cocoapods/l/ODWeakify.svg?style=flat)](http://cocoapods.org/pods/ODWeakify)
[![Platform](https://img.shields.io/cocoapods/p/ODWeakify.svg?style=flat)](http://cocoapods.org/pods/ODWeakify)

## Usage

Do you often write smthng like this in ObjC?
```objective-c
__weak __typeof(self) weakSelf = self;
self.completionHandler = ^{
    __typeof(self) strongSelf = weakSelf;
    [strongSelf doSomething];

    // or just use weakSelf
    weakSelf.var = nil;
    
    // some other code
    self.property = @"foo";
};
```

It looks horrible. And, did you notice, we forgot to use weakSelf when set foo. 
It's really often mistake. So, with ODWeakify you can do it easier:

```objective-c
// #import <ODWeakify.h>

od_weakify(self);
self.completionHandler = ^{
    od_strongify(self);
    [self doSomething];

    self_weak_.var = nil; // We can still use weak if we need it 
    self.property = @"foo";  
};

```
Now all `self`s inside block will be in safe from retain cycles. 
And if you forget strongify (and won't use self_weak_) you'll get a warning. 

## Installation

ODWeakify is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ODWeakify'
```

## Author

Alexey Nazaroff, alexx.nazaroff@gmail.com

## License

ODWeakify is available under the MIT license. See the LICENSE file for more info.

