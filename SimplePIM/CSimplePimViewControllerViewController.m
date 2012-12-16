//
//  CSimplePimViewControllerViewController.m
//  SimplePIM
//
//  Created by Hemanta Sapkota on 12/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CSimplePimViewControllerViewController.h"
#import "CPListTableViewController.h"

@interface CSimplePimViewControllerViewController ()

@end

@implementation CSimplePimViewControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onBankAcClicked:(id)sender {
    CPListTableViewController *cPimController = [[CPListTableViewController new] initWithDataFile:@"netbank"];
    [cPimController setTitle:@"Bank A/C"];
    [self.navigationController pushViewController:cPimController animated:true];
}

- (IBAction)onGmailIdClicked:(id)sender {
    CPListTableViewController *cPimController = [[CPListTableViewController new] initWithDataFile:@"gmail"];
    [cPimController setTitle:@"Gmail ID"];
    [self.navigationController pushViewController:cPimController animated:true];
}


@end
