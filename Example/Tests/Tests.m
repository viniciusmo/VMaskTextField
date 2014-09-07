//
//  VMaskTextFieldTests.m
//  VMaskTextFieldTests
//
//  Created by viniciusmo on 09/05/2014.
//  Copyright (c) 2014 viniciusmo. All rights reserved.
//

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

  context(@"will fail", ^{

      it(@"can do maths", ^{
          [[@1 should] equal:@1];
      });

      it(@"can read", ^{
          [[@"number" should] equal:@"number"];
      });

  });

  context(@"will pass", ^{
    
      it(@"can do maths", ^{
        [[@1 should] beLessThan:@23];
      });
    
      it(@"can read", ^{
          [[@"team" shouldNot] containString:@"I"];
      });  
  });
  
});

SPEC_END
