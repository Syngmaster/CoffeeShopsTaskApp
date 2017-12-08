//
//  SMDetailsViewController.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCoffeeShopModel;

@interface SMDetailsViewController : UIViewController

@property (strong, nonatomic) SMCoffeeShopModel *selectedShop;

@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopWebsiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopOpenTime;
@property (weak, nonatomic) IBOutlet UITableView *reviewsTableView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
