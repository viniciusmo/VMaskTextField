/*
 Copyright (c) 2014 viniciusmo <vinicius.moises.oliveira@gmail.com>
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "VMaskTextField.h"

NSString * kVMaskTextFieldDefaultChar = @"#";

@implementation VMaskTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.defaultCharMask = kVMaskTextFieldDefaultChar;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultCharMask = kVMaskTextFieldDefaultChar;
    }
    return self;
}

- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString * currentTextDigited = [self.text stringByReplacingCharactersInRange:range withString:string];
    if (string.length == 0) {
        unichar lastCharDeleted = 0;
        while (currentTextDigited.length > 0 && !isnumber([currentTextDigited characterAtIndex:currentTextDigited.length-1])) {
            lastCharDeleted = [currentTextDigited characterAtIndex:[currentTextDigited length] - 1];
            currentTextDigited = [currentTextDigited substringToIndex:[currentTextDigited length] - 1];
        }
        self.text = currentTextDigited;
        return NO;
    }
    
    NSMutableString * returnText = [[NSMutableString alloc] init];
    if (currentTextDigited.length > _mask.length) {
        return NO;
    }
    
    int last = 0;
    BOOL needAppend = NO;
    for (int i = 0; i < currentTextDigited.length; i++) {
        unichar  currentCharMask = [_mask characterAtIndex:i];
        unichar  currentChar = [currentTextDigited characterAtIndex:i];
        if (isnumber(currentChar) && currentCharMask == '#') {
            [returnText appendString:[NSString stringWithFormat:@"%c",currentChar]];
        }else{
            if (currentCharMask == '#') {
                break;
            }
            if (isnumber(currentChar)) {
                needAppend = YES;
            }
            [returnText appendString:[NSString stringWithFormat:@"%c",currentCharMask]];
        }
        last = i;
    }
    
    for (int i = last+1; i < _mask.length; i++) {
        unichar currentCharMask = [_mask characterAtIndex:i];
        if (currentCharMask != '#') {
            [returnText appendString:[NSString stringWithFormat:@"%c",currentCharMask]];
        }
        if (currentCharMask == '#') {
            break;
        }
    }
    if (needAppend) {
        [returnText appendString:string];
    }
    self.text = returnText;
    return NO;
}

-(double) rawToDouble{
    return [_raw doubleValue];
}

-(float) rawToFloat{
    return [_raw floatValue];
}

-(NSInteger) rawToInteger{
    return [_raw intValue];
}

-(NSDate *)rawToDate:(NSDateFormatter *)formatter{
    NSDate *date = [formatter dateFromString:_raw];
    return date;
}

@end
