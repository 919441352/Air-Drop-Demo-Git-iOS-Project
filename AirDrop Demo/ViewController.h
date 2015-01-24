//
//  ViewController.h
//  AirDrop Demo
//
//  Created by Ramakrishna Makkena on 1/15/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSString *fileInfo;
@property (nonatomic,strong) NSURL *pathURL;

- (IBAction)sendFileTapped:(id)sender;


@end

