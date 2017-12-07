//
//  SMDetailsViewController.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeePhoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeWebsiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeAddressLabel;
@property (weak, nonatomic) IBOutlet UITableView *reviewsTableView;
- (IBAction)openHoursAction:(UIButton *)sender;



@end
