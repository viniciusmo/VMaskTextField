#import "VViewController.h"

@interface VViewController ()

@property (weak,nonatomic) IBOutlet VMaskTextField * maskTextField;

@end

@implementation VViewController

- (void)viewDidLoad{
    //Telephone with Code Area
    self.maskTextField.mask = @"(##) ####-####";
    self.maskTextField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   return  [_maskTextField shouldChangeCharactersInRange:range replacementString:string];
}

@end
