# ODWeakify

[![Build Status](https://travis-ci.org/Rogaven/ODWeakify.svg?branch=master)](https://travis-ci.org/Rogaven/ODWeakify)
[![codecov.io](https://codecov.io/github/Rogaven/ODWeakify/coverage.svg?branch=master)](https://codecov.io/github/Rogaven/ODWeakify?branch=master)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ODWeakify.svg)](https://img.shields.io/cocoapods/v/ODWeakify.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/ODWeakify.svg?style=flat)](http://cocoadocs.org/docsets/ODWeakify)
[![Twitter](https://img.shields.io/badge/twitter-@nazarff-blue.svg?style=flat)](http://twitter.com/nazarff)


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
ODWeakify supports multiple methods for installing the library in a project.

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C and Swift, which automates and simplifies the process of using 3rd-party libraries like ODWeakify in your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile

To integrate ODWeakify into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'ODWeakify'
end
```

Then, run the following command:

```bash
$ pod install
```

### Installation with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ODWeakify into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Rogaven/ODWeakify" ~> 1.1
```

Run `carthage` to build the framework and drag the built `ODWeakify.framework` into your Xcode project.


## Author

Alexey Nazaroff, alexx.nazaroff@gmail.com

## License

ODWeakify is available under the MIT license. See the LICENSE file for more info.

