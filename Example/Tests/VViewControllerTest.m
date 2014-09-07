//
//  VViewControllerTest.m
//  VMaskTextField
//
//  Created by viniciusmo on 9/7/14.
//  Copyright (c) 2014 viniciusmo. All rights reserved.
//

#import "KIF.h"
#import <VMaskTextField.h>

@interface VViewControllerTest : KIFTestCase

@end

@implementation VViewControllerTest

-(void)testWithInputDateValidShouldReturnSuccess{
    [tester enterText:@"11111111" intoViewWithAccessibilityLabel:@"txtDate" traits:UIAccessibilityTraitNone expectedResult:@"11/11/1111"];
}

-(void)testWithInputHourValidShouldReturnSuccess{
    [tester enterText:@"111111" intoViewWithAccessibilityLabel:@"txtHour" traits:UIAccessibilityTraitNone expectedResult:@"11:11:11"];
}

-(void)testWithInputDateAndHourValidShouldReturnSuccess{
    [tester enterText:@"11111111111111" intoViewWithAccessibilityLabel:@"txtDateAndHour" traits:UIAccessibilityTraitNone expectedResult:@"11/11/1111 11:11:11"];
}

-(void)testWithInputTelephoneValidShouldReturnSuccess{
    [tester enterText:@"1111111111" intoViewWithAccessibilityLabel:@"txtTelephone" traits:UIAccessibilityTraitNone expectedResult:@"(11) 1111-1111"];
}

@end
