//
//  CPListTableViewController.h
//  SimplePIM
//
//  Created by Hemanta Sapkota on 12/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPListTableViewController : UITableViewController

//we init this class via this method. In the input, we provide the PLIST filename without
//the extension
- (id) initWithDataFile:(NSString*)dataFile; 

@end

NSDictionary *contentsMap; //the contents of the PLIST file is stored as a map with key/value pairs
NSString *dataFile; //reference to the filename

NSArray *sections; //all the keys in the PLIST files are treated as sections in the table view controller
