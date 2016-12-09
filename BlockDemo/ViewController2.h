//
//  ViewController2.h
//  BlockDemo
//
//  Created by Mac on 2016/12/9.
//  Copyright © 2016年 TUTK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController



/**
 设置一个block,当页面返回时回调
 */

//1.
@property (nonatomic, copy) void (^callBackColor)(UIColor *myColor);

//2.或者
//typedef void (^Block)(UIColor *myColor);
//@property (nonatomic, copy) Block callBackColor;




- (IBAction)backVc:(id)sender;

@end
