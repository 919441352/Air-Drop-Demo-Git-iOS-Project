//
//  ViewController.m
//  AirDrop Demo
//
//  Created by Ramakrishna Makkena on 1/15/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.fileInfo=@"This is content in the file.....";
    
    //Get the URL to the Document Directory
    NSString *filePath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Append the File name to Path
    filePath=[filePath stringByAppendingPathComponent:@"exFile.txt"];
    
    
    //make the URL the From the Path
    self.pathURL=[NSURL fileURLWithPath:filePath];
    
    NSError *error;
    
    
    //Write the File to the Path or log the error and exit the fail code
    if(![self.fileInfo writeToURL:self.pathURL atomically:YES encoding:NSUTF8StringEncoding error:&error])
    {
        NSLog(@"Error %@",error.localizedDescription);
        exit(1);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendFileTapped:(id)sender {
    
    //setup the new Activity View Controller by using the file URL
    UIActivityViewController *myActivityVC=[[UIActivityViewController alloc]initWithActivityItems:@[self.pathURL] applicationActivities:nil];
    
    //Present the Activity View Controller
    [self presentViewController:myActivityVC animated:YES completion:nil];
    
    //Note that if there are no airdrop enabled devices near only the default mail activity will be shown 
}
@end
