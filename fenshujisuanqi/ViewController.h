//
//  ViewController.h
//  fenshujisuanqi
//
//  Created by leo on 16/3/7.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFacepart;

//number button
-(IBAction) clickDigit: (UIButton *) sender;

//caculate option button
-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultply;
-(IBAction) clickDivide;

//misc button

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end

