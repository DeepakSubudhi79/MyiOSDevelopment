//
//  ViewController.m
//  MD5Encryption
//
//  Created by Deepak on 16/08/13.
//  Copyright (c) 2013 Deepak. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *test = [self md5:@"deepak"];
    NSMutableString *result = [NSMutableString stringWithCapacity:100];
    [result appendString:[test substringFromIndex:2]];
    [result appendString:[test substringToIndex:2]];
                        NSLog(@"Result: %@",result);
    //498b5924adc469aa7b660f457e0fc7e5
    //NSLog(NSString *format, ...)
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;//Returns the output
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
