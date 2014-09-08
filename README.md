# VMaskTextField

[![CI Status](http://img.shields.io/travis/viniciusmo/VMaskTextField.svg?style=flat)](https://travis-ci.org/viniciusmo/VMaskTextField)
[![Version](https://img.shields.io/cocoapods/v/VMaskTextField.svg?style=flat)](http://cocoadocs.org/docsets/VMaskTextField)
[![License](https://img.shields.io/cocoapods/l/VMaskTextField.svg?style=flat)](http://cocoadocs.org/docsets/VMaskTextField)
[![Platform](https://img.shields.io/cocoapods/p/VMaskTextField.svg?style=flat)](http://cocoadocs.org/docsets/VMaskTextField)


An inputmask helps the user with the input by ensuring a predefined format. This can be useful for dates, numerics, phone numbers  etc

![demo](https://raw.githubusercontent.com/viniciusmo/VMaskTextField/master/Resources/vmasktextfield.gif)

## Usage
```objective-c
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
```
## Features

 - Validating  data type
 - Flexible masks
 - Automatic maxlength

## Installation

VMaskTextField is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod "VMaskTextField"
```
or copy **VMaskTextField.h** and **VMaskTextField.m** to your project folder.


## Author

viniciusmo, vinicius.moises.oliveira@gmail.com

## License

VMaskTextField is available under the MIT license. See the LICENSE file for more info.

