//
//  ViewController.m
//  TestRequest
//
//  Created by Даниил Кравчук on 27.06.2021.
//

#import "ViewController.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)locationButtonTapped:(id)sender {
    NSString *locationText = _locationTextField.text;
    XPWeatherData *weather = [[XPWeatherData alloc] init];
    [weather currentWeatherWithLocation:[locationText lowercaseString] withBlock:^(NSString *tempreture) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([tempreture  isEqual: @"Error occured"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Погода:" message:[NSString stringWithFormat:@"Введите правильное название"] preferredStyle:UIAlertControllerStyleAlert];

                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler: nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
            } else {
            
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Погода:" message:[NSString stringWithFormat:@"%@", tempreture] preferredStyle:UIAlertControllerStyleAlert];

                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler: nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
            
            }
        });
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [_locationTextField resignFirstResponder];
    }
}

@end
