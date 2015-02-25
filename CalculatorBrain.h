//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Anthony on 2/1/15.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double) operand;
- (double)performOperation:(NSString *)operation;
- (double)performTrigOp:(NSString *)operation;
- (double)performSqrt:(NSString *)operation;
- (double)changeSign:(NSString *)operation;
@end
