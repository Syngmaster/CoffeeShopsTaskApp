//
//  SMReviewsViewCell.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMReviewModel;

@interface SMReviewsViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *reviewUserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewBodyLabel;

- (void)configureCellWithDetails:(SMReviewModel *)model;

@end
