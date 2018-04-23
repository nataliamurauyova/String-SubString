//
//  ViewController.m
//  String
//
//  Created by Наташа on 19.04.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    void(^sqBlock)(NSString*)= ^(NSString* str){
        NSRange openSq = [str rangeOfString:@"["];
        NSRange closeSq = [str rangeOfString:@"]"];
        NSRange sqExpression = NSMakeRange(openSq.location + 1, closeSq.location-openSq.location-1);
        NSString* sqExp = [str substringWithRange:sqExpression];
        NSLog(@"String in square brackets is %@",sqExp);
        /*NSRange newRange = NSMakeRange(0, closeSq.location+1);
        NSString* newStr = [str substringWithRange:newRange];
        NSRange r = NSMakeRange(closeSq.location+1, str.length-newStr.length);
        NSString* subStr = [str substringWithRange:r]; */
    };
    void(^tagBlock)(NSString*)= ^(NSString* str){
        NSRange openTag = [str rangeOfString:@"<"];
        NSRange closeTag = [str rangeOfString:@">"];
        NSRange sqExpression = NSMakeRange(openTag.location + 1, closeTag.location-openTag.location-1);
        NSString* sqExp = [str substringWithRange:sqExpression];
        NSLog(@"String in tag brackets is %@",sqExp);
    };
    void(^parBlock)(NSString*)= ^(NSString* str){
        NSRange openPar = [str rangeOfString:@"("];
        NSRange closePar = [str rangeOfString:@")"];
        NSRange sqExpression = NSMakeRange(openPar.location + 1, closePar.location-openPar.location-1);
        NSString* sqExp = [str substringWithRange:sqExpression];
        NSLog(@"String in round brackets is %@",sqExp);
        
    };

    
    NSString* st = @"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the (<debate> on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University]";
    for (int i=0; i<st.length; i++) {
        NSString* element = [st substringWithRange:NSMakeRange(i, 1)];
        NSString* curr=[st substringFromIndex:i];
        if ([element isEqualToString:@"["]){
            sqBlock(curr);
        }
        if ([element isEqualToString:@"<"]) {
            tagBlock(curr);
        }
        if ([element isEqualToString:@"("]) {
            parBlock(curr);
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
