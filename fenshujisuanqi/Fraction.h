//
//  Fraction.h
//  fenshujisuanqi
//
//  Created by leo on 16/3/8.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void)             print;
-(void)             setTo: (int) n over: (int) d;
-(Fraction *)       add: (Fraction *) f;
-(Fraction *)       subtract: (Fraction *) f;
-(Fraction *)       multply: (Fraction *) f;
-(Fraction *)       divide: (Fraction *) f;
-(void)             reduce;
-(double)           convertToNum;
-(NSString *)       convertToString;

@end
