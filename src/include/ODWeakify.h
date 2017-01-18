// ODWeakify.h
//
// Copyright (c) 2009-2015 Alexey Nazaroff, AJR
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <ODStringify.h>

/** Weakify any variable
 * After weakify you can use it as weak var with name $(var)_weak_ 
 * or make od_strongify and use it as usual
 * @code
 od_weakify(self)
 self.block = ^{
    self_weak_.val = something
    ...
 }
 * @endcode
 */
#define od_weakify(obj)     __weak __typeof(obj) ODConcat(obj, _weak_) = obj;

/** Strongify any variable
 * @code
 od_weakify(self)
 self.block = ^{
    od_strongify(self)
    self.val = something
 }
 * @endcode
 */
#define od_strongify(obj)   _Pragma("clang diagnostic push")                    \
                            _Pragma("clang diagnostic ignored \"-Wshadow\"")    \
                            __strong __typeof(obj) obj = ODConcat(obj, _weak_); \
                            _Pragma("clang diagnostic pop")
