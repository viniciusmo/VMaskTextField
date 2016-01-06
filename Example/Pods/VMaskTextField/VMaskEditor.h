//
//  VMaskEditor.h
//  Pods
//
//  Created by viniciusmo on 1/6/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VMaskEditor : NSObject

+(BOOL)shouldChangeCharactersInRange:(NSRange)range
                   replacementString:(NSString *)string
                           textField:(UITextField *)textField
                                mask:(NSString *)mask;

@end
