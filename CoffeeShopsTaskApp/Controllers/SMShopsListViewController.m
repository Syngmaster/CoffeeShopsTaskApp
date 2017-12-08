//
//  SMShopsListViewController.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMShopsListViewController.h"
#import "SMDetailsViewController.h"
#import "SMCoffeeShopViewCell.h"
#import "SMCoffeeShopModel.h"
#import "SMServerManager.h"

@interface SMShopsListViewController () <UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayOfShops;

@end

@implementation SMShopsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Choose a coffee shop";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.activityIndicator startAnimating];
    
    [[SMServerManager sharedManager] getListOfCoffeeShopsOnComplete:^(NSArray *array) {
        
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidesWhenStopped:YES];

        if (array) {
            self.arrayOfShops = array;
            [self.tableView reloadData];
        } else {
            [self raiseNoInternetConnectionAlert];
        }

    }];
    
}

- (void)raiseNoInternetConnectionAlert {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"No connection" message:@"Please, check you internet connection!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:okAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - Prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"details"]) {
        SMDetailsViewController *destinationVC = segue.destinationViewController;
        destinationVC.selectedShop = sender;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrayOfShops count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SMCoffeeShopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[SMCoffeeShopViewCell alloc] init];
    }

    SMCoffeeShopModel *shop = [self.arrayOfShops objectAtIndex:indexPath.row];
    [cell configureCellWithShop:shop];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SMCoffeeShopModel *shop = [self.arrayOfShops objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"details" sender:shop];
    
}



@end
