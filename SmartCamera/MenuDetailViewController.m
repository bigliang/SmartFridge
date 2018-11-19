//
//  MenuDetailViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 11/18/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "MenuDetailViewController.h"

@interface MenuDetailViewController ()

@end

@implementation MenuDetailViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLable.text = self.recipt.title;
    self.categoryLabel.text = self.recipt.category;
    self.descriptionLabel.text = self.recipt.descript;
    // Do any additional setup after loading the view.
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
