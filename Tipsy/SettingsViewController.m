//
//  SettingsViewController.m
//  Tipsy
//
//  Created by Bevin Benson on 6/26/18.
//  Copyright © 2018 Bevin Benson. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEdit:(id)sender {
    
   double defaultIndex = self.defaultTipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble: defaultIndex  forKey: @"defaultTipControl"];
    [defaults synchronize];
    
    /*
    double defaultIndex2 = [defaults doubleForKey:@"defaultTipControl"];
    NSLog(@"HELLO WORLD");
     */
     
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
