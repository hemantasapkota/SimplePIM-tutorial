//
//  CPListTableViewController.m
//  SimplePIM
//
//  Created by Hemanta Sapkota on 12/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPListTableViewController.h"

@implementation CPListTableViewController


- (id) initWithDataFile:(NSString*)_dataFile {
	self = [super init];
	if (self == nil)
		return nil;
	
	dataFile = _dataFile;
    
	NSString *dataPath = [[NSBundle mainBundle] pathForResource:dataFile ofType:@"plist"];
	contentsMap = [[NSDictionary alloc] initWithContentsOfFile:dataPath];
    sections = [[NSArray alloc] initWithArray:[contentsMap allKeys]];
    
	return self;
}

#pragma mark Table

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sections objectAtIndex:section];
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [sections count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // no. of rows and no. of sections are the same
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *cellId = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
    
    NSString *key = [sections objectAtIndex:indexPath.section];
	NSString *value = [contentsMap valueForKey:key];
	
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
    
    bool isPassword = [key isEqualToString:@"Password"];
    bool isPin = [key rangeOfString:@"pin" options:NSCaseInsensitiveSearch].location != NSNotFound;
    
    
    if (isPassword || isPin) {
        cell.textLabel.text = @"**********";
        cell.userInteractionEnabled = YES;
    } else {
        cell.textLabel.text = value;
        cell.userInteractionEnabled = NO;
    }
    
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [sections objectAtIndex:indexPath.section];
	NSString *value = [contentsMap valueForKey:key];
    
    //
    UIAlertView *alertView = [[UIAlertView alloc] 
                              initWithTitle:@"Password" 
                              message:value 
                              delegate:nil 
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, 
                              nil];
    [alertView show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
