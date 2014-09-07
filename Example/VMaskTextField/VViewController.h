//
//  VViewController.h
//  VMaskTextField
//
//  Created by viniciusmo on 09/05/2014.
//  Copyright (c) 2014 viniciusmo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMaskTextField.h"

@interface VViewController : UIViewController<UITextFieldDelegate>

@property (weak,nonatomic) IBOutlet VMaskTextField * maskTextFieldDate;
@property (weak,nonatomic) IBOutlet VMaskTextField * maskTextFieldHour;
@property (weak,nonatomic) IBOutlet VMaskTextField * maskTextFieldDateAndHour;
@property (weak,nonatomic) IBOutlet VMaskTextField * maskTextFieldTelephone;

@end
