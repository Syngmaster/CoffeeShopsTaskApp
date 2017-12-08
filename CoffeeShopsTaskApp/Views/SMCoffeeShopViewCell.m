//
//  SMCoffeeShopViewCell.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCoffeeShopViewCell.h"
#import "SMCoffeeShopModel.h"

@implementation SMCoffeeShopViewCell

- (void)configureCellWithShop:(SMCoffeeShopModel *)model {
    
    self.shopNameLabel.text = model.shopName;
    self.shopAddressLabel.text = model.shopAddress;
    
}

@end
