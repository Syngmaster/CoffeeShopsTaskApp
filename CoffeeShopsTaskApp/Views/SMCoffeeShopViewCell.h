//
//  SMCoffeeShopViewCell.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCoffeeShopModel;

@interface SMCoffeeShopViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopAddressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;

- (void)configureCellWithShop:(SMCoffeeShopModel *)model;

@end
