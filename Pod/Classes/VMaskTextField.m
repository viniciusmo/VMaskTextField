#import "VMaskTextField.h"
#import "VMaskEditor.h"

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

-(void) setTextWithMask:(NSString *) text{
    NSAssert(_mask!=nil, @"Mask is nil.");
    for (int i = 0; i < text.length; i++) {
        if (self.text.length == _mask.length) {
            break;
        }
        [self shouldChangeCharactersInRange:NSMakeRange(i, 0) replacementString:[NSString stringWithFormat:@"%c",[text characterAtIndex:i]]];
    }
}

- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.disallowEditingBetweenCharacters) {
        NSInteger minimanAllowedLocation = self.text.length - 1;
        NSInteger editionLocation = range.location;
        if (editionLocation < minimanAllowedLocation) {
            [self resignFirstResponder]; // Do a trick with first responded to move
            [self becomeFirstResponder]; // cursor to the end of text field
            return NO;
        }
    }
    return [VMaskEditor shouldChangeCharactersInRange:range replacementString:string textField:self mask:_mask];
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
