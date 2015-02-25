//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Anthony on 2/1/15.
//
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;
@synthesize brainDisplay;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
    self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];

    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)secondDisplay:(id)sender
{
    [self.brain pushOperand:[self.brainDisplay.text doubleValue]];
}

- (IBAction)operationPressed:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)decimalPressed:(id)sender
{
    NSRange range = [self.display.text rangeOfString:@"."];
    if (range.location == NSNotFound)
    {
        self.display.text = [self.display.text stringByAppendingString:@"."];
    }
    self.userIsInTheMiddleOfEnteringANumber = YES;
}

- (IBAction)clearPressed:(id)sender
{
    self.display.text = [NSString stringWithFormat:@"0"];
    self.userIsInTheMiddleOfEnteringANumber = NO;}

- (IBAction)backPressed:(id)sender
{
    NSString *string = self.display.text;
    int length = string.length;
    if(string.length > 1)
    {
        NSString *temp = [string substringToIndex:length-1];
        self.display.text = temp;
    }
    else
        self.display.text = [NSString stringWithFormat:@"0"];
    
}

- (IBAction)trigOpPressed:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performTrigOp:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)sqrtPressed:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
        [self enterPressed];
    NSString *operation = [sender currentTitle];
    double result = [self.brain performSqrt:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)piPressed:(id)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)signChange:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
        [self enterPressed];
    NSString *operation = [sender currentTitle];
    double result = [self.brain changeSign:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}




@end
