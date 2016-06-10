//
//  ViewController.m
//  fenshujisuanqi
//
//  Created by leo on 16/3/7.
//  Copyright © 2016年 leo. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@implementation ViewController
{
    char  op;
    int   currentNumber;
    BOOL           firstOperand, isNumerator;
    Calculator       *myCalculator;
    NSMutableString   *displayString;
}

@synthesize display;

-(void) viewDidLoad
{
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
}

-(void) processDigit: (int) digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
    NSLog(@"%i",digit);
}

-(IBAction) clickDigit: (UIButton *) sender
{
    int digit = sender.tag;
    
    [self processDigit: digit];
}

-(void) processOp: (char) theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
     
    }
    
    [self storeFacepart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

-(void) storeFacepart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1; //eg: 3 * 4/5 =
            }
        else
            myCalculator .operand1.denominator = currentNumber;
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1; //eg: 3/2 * 4 =
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
       firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction) clickOver;
{
    [self storeFacepart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

//suansucaozuofu

-(IBAction) clickPlus
{
    [self processOp: '+'];
}


-(IBAction) clickMinus
{
    [self processOp: '-'];
}

-(IBAction) clickMultply
{
    [self processOp: '*'];
}


-(IBAction) clickDivide
{
    [self processOp: '/'];
}

//misc

-(IBAction) clickEquals
{
    if ( firstOperand == NO ) {
        [self storeFacepart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator
                                      convertToString]];
         display.text = displayString;
         
         currentNumber = 0;
         isNumerator = YES;
         firstOperand = YES;
         [displayString setString: @""];
    }
}
         
         
-(IBAction) clickClear
{
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}
        

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
