//
//  SMDetailsViewController.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDetailsViewController.h"
#import "SMReviewsViewCell.h"
#import "SMCoffeeShopModel.h"
#import "SMCoffeeShopDetailsModel.h"
#import "SMReviewModel.h"
#import "SMServerManager.h"

@interface SMDetailsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SMCoffeeShopDetailsModel *shopDetails;

@end

@implementation SMDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.selectedShop.shopName;
    
    //*** setting resizable tableviewcell depending on the review body content
    
    self.reviewsTableView.rowHeight = UITableViewAutomaticDimension;
    self.reviewsTableView.estimatedRowHeight = 60;
    self.reviewsTableView.bounces = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.activityIndicator startAnimating];
    
    [[SMServerManager sharedManager] getDetailsOfCoffeeShop:self.selectedShop.shopID onCompletion:^(SMCoffeeShopDetailsModel *shopDetails) {
       
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidesWhenStopped:YES];

        if (shopDetails) {
            self.shopDetails = shopDetails;
            [self updateUIWithShopDetails:shopDetails];
            [self.reviewsTableView reloadData];
        } else {
            [self raiseNoInternetConnectionAlert];
        }
        
    }];
    
}

- (void)updateUIWithShopDetails:(SMCoffeeShopDetailsModel *)shopDetails {
    
    self.shopOpenTime.text = shopDetails.shopOpenTime ? shopDetails.shopOpenTime : @"No hours listed";
    self.shopAddressLabel.text = shopDetails.shopAddress;
    self.shopRatingLabel.text = [NSString stringWithFormat:@"%@",
                                   shopDetails.shopRating ?
                                   [NSString stringWithFormat:@"%0.1f/10", shopDetails.shopRating] : @"No rating"];
    self.shopPhoneLabel.text = [NSString stringWithFormat:@"%@",
                                        shopDetails.shopPhoneNumber ?
                                        shopDetails.shopPhoneNumber : @"No number"];
    self.shopWebsiteLabel.text = [NSString stringWithFormat:@"%@",
                                    shopDetails.shopWebsite ?
                                    shopDetails.shopWebsite : @"No website"];
    
    [self loadImageFromURL:[NSURL URLWithString:shopDetails.shopPhotoURL] onCompletion:^(UIImage *image) {
        self.shopImageView.image = image ? image : [UIImage imageNamed:@"no_image_img.png"];
    }];
    
}

- (void)loadImageFromURL:(NSURL *)url onCompletion:(void(^)(UIImage *image))completionHandler {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSError *error = nil;
        NSData *imageData = [NSData dataWithContentsOfURL:url options:0 error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                completionHandler(nil);
            } else {
                UIImage *image = [UIImage imageWithData:imageData];
                completionHandler(image);
            }

        });
    });
}

- (void)raiseNoInternetConnectionAlert {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"No connection" message:@"Please, check you internet connection!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:okAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SMReviewsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[SMReviewsViewCell alloc] init];
    }
    
    SMReviewModel *review = [self.shopDetails.reviewsArray objectAtIndex:indexPath.row];
    [cell configureCellWithDetails:review];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.shopDetails.reviewsArray count];
}

@end
