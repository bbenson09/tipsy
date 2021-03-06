//
//  ViewController.m
//  Tipsy
//
//  Created by Bevin Benson on 6/26/18.
//  Copyright © 2018 Bevin Benson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text  = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text  = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame  = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y + 30, self.mealBillField.frame.size.width, self.mealBillField.frame.size.height);
        
    }];
     
     [UIView animateWithDuration: 1 animations: ^{
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -= 30;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.mealBillField.frame = newFrame;
        
    }];
    
    [UIView animateWithDuration: 1 animations:^ {
        self.tipLabel.alpha = 1;
        
        
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    double defaultIndex = [defaults doubleForKey:@"defaultTipControl"];
    
    self.tipControl.selectedSegmentIndex = defaultIndex;
    
    // More hacky than I would like
    [self onEdit:nil];
    
}

@end
