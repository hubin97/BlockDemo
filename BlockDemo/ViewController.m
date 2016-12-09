//
//  ViewController.m
//  BlockDemo
//
//  Created by Mac on 2016/12/9.
//  Copyright © 2016年 TUTK. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()


/**
 带参有返回值
 */
@property (nonatomic, copy) int (^ blockA) (int num1, int num2);

//或写成下面两句
typedef int (^BlockA)(int num1, int num2);
@property (nonatomic, copy) BlockA blockAA;



/**
 带参无返回值
 */
@property (nonatomic, copy) void (^ blockB) (int num1, int num2);

//或写成下面两句
typedef void (^BlockB)(int num1, int num2);
@property (nonatomic, copy) BlockB blockBB;



/**
 不带参有返回值
 */
@property (nonatomic, copy) int (^ blockC)();

//或写成下面两句
typedef int (^BlockC)();
@property (nonatomic, copy) BlockC blockCC;


/**
 不带参无返回值
 */
@property (nonatomic, copy) void (^ blockD)();

//或写成下面两句
typedef void (^BlockD)();
@property (nonatomic, copy) BlockD blockDD;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //====带参返回======
    //1-1.
    _blockA = ^(int index1, int index2)
    {
        return index1 * index2;
    };
    
    int count = _blockA(4,5);
    
    NSLog(@"1-1count*=:%d",count);
    
    
    //
//    _blockAA = ^(int index1, int index2)
//    {
//        return index1 * index2;
//    };
//    
//    NSLog(@"_blockAA =:%d",_blockAA(4,6));
    
    
    //1-2
    int (^ blcokAb)(int, int) = ^(int index1, int index2)
    {
        return index1 * index2;
    };
    
    NSLog(@"1-2count*=:%d",blcokAb(5,6));
    
    
    //====带参无返回======
    //2-1.
    _blockB = ^(int index1, int index2)
    {
        NSLog(@"2-1count+= %d",index1 + index2);
    };
    
    _blockB(1,4);
    
    //2-2
    void (^blockBb)(int, int) = ^(int index1, int index2)
    {
        NSLog(@"2-2count+= %d",index1 + index2);
    };
    
    blockBb(3,3);
    
    
    //====不带参有返回======
    //3-1
    _blockC = ^()
    {
        return 12/3;
    };
    
    NSLog(@"3-1bc/=%d",_blockC());
    
    
    //3-2.
    int (^ blockCb)() = ^()
    {
        int ret = 10/2;
        return ret;
    };
    
    NSLog(@"3-2bc/=%d ",blockCb());
    
    
    //====不带参无返回======
    //4-1
    _blockD = ^()
    {
        NSLog(@"4-1不带参无返回");
    };
    
    _blockD();
    
    
    //4-2
    
    void (^blockDb)() = ^()
    {
        NSLog(@"4-2不带参无返回");
    };
    
    blockDb();
    
    //4-3
    void (^blockDc)() = ^
    {
        NSLog(@"4-3不带参无返回");
    };
    blockDc();
    
    //4-4
    void (^ blockDd)(void) = ^
    {
        NSLog(@"4-4不带参无返回");
    };
    blockDd();
    
    //!!!!: 由 4-*可以看出,不带参时, 声明可以使用(),也可以使用(void); 而block块的()可以去掉
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toVc2:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    
    
    // 实现block回调
    vc2.callBackColor = ^(UIColor *myColor)
    {
        self.view.backgroundColor = myColor;
    };
    
    [self presentViewController:vc2 animated:nil completion:nil];
}
@end
