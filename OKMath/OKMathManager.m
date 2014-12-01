//
//  OKMathManager.m
//  OKMath
//
//  Created by omer on 29/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import "OKMathManager.h"
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@implementation OKMathManager
{
    OKMathAnswer * mathAnswer;
}
- (id)init
{
    if(self)
    {
        _level = 0;
    }
    
  return self;
}



- (void)setDelegate:(id)delegate
{
    _delegate = delegate;
    _level    = 0;// first
    
    [self callDelegateFunction];
}

- (void)changeLevel:(NSInteger)lwl
{
    _level = lwl;
    
    [self callDelegateFunction];
}

- (void)callDelegateFunction
{
    mathAnswer = [[OKMathAnswer alloc]init];
    
    [mathAnswer createAnswerWhitLevel:_level];
    
    [_delegate okMathManagerAnswer:mathAnswer.answerString questionA:mathAnswer.questionStringA questionB:mathAnswer.questionStringB questionC:mathAnswer.questionStringC questionD:mathAnswer.questionStringD trueQuestionToken:mathAnswer.trueQuestionSelector];

}

- (void)hardAnswerTheQuestion:(NSInteger)lwl
{
    
}

@end

@implementation OKMathAnswer
{
    int entitySymbol;
    int selector; // This number is positive or negatif number
    NSMutableString * answerMutableString;
    
    NSInteger questA;
    NSInteger questB;
    NSInteger questC;
    NSInteger questD;
    
    NSInteger trueQuestion;
    
    NSString * elementString; // This question elements
    
    NSMutableArray * answerElementsArray;
    
}
- (void)createAnswerWhitLevel:(NSInteger)lwl
{
    answerMutableString = [[NSMutableString alloc]init];
    answerElementsArray = [NSMutableArray array];
    
  
    
    switch (lwl) {
        case 0:
            
            [self positiveOrNegativeNumber:0];// positive numbers
            
            [self createAnswerElementsArrayWithNumber:2 minInt:0 maxInt:10];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:0]];
            
            [self doAnswersWithMathSymbol:0];
            
             [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:1]];
            
            
            _answerString = [NSString stringWithFormat:@"%@",answerMutableString];
            
            [self whatIsTrueQuestionWithTWOElements];
            
            [self questTokensAddingElementsWithMinInt:0 maxInt:10];
            
            
            break;
        case 1:
            [self positiveOrNegativeNumber:0];// positive numbers
            
            [self createAnswerElementsArrayWithNumber:2 minInt:15 maxInt:30];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:0]];
            
            [self doAnswersWithMathSymbol:0];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:1]];
            
            
            _answerString = [NSString stringWithFormat:@"%@",answerMutableString];
            
            [self whatIsTrueQuestionWithTWOElements];
            
            [self questTokensAddingElementsWithMinInt:50 maxInt:60];
            
            break;
        case 2:
            
            [self positiveOrNegativeNumber:0];// positive numbers
            
            [self createAnswerElementsArrayWithNumber:2 minInt:25 maxInt:40];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:0]];
            
            [self doAnswersWithMathSymbol:2];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:1]];
            
            
            _answerString = [NSString stringWithFormat:@"%@",answerMutableString];
            
            [self whatIsTrueQuestionWithTWOElements];
            
            [self questTokensAddingElementsWithMinInt:65 maxInt:80];
            
            break;
        case 3:
            [self positiveOrNegativeNumber:0];// positive numbers
            
            [self createAnswerElementsArrayWithNumber:2 minInt:65 maxInt:75];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:0]];
            
            [self doAnswersWithMathSymbol:2];
            
            [answerMutableString appendFormat:@"%@",[answerElementsArray objectAtIndex:1]];
            
            
            _answerString = [NSString stringWithFormat:@"%@",answerMutableString];
            
            [self whatIsTrueQuestionWithTWOElements];
            
            [self questTokensAddingElementsWithMinInt:65 maxInt:80];
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        case 9:
            break;
        case 10:
            break;
        case 11:
            break;
        case 12:
            break;
        case 13:
            break;
        default:
            //Very Strong
            break;
    }
}
- (void)positiveOrNegativeNumber:(int)k
{
    if(k == 0)
    {
        selector = 0; // positive
    }else
        selector = 1; // negative
}
- (void)createAnswerElementsArrayWithNumber:(int)i minInt :(int)min maxInt :(int)max;
{
    for (int k =0; k < i; k++) {
        if(selector == 1)
        {
            //negative
            min = min * (-1);
            max = max * (-1);
            
            NSNumber * el = [[NSNumber alloc] initWithInt:RAND_FROM_TO(max, min)];
            [answerElementsArray addObject:el];
            
        }else
        {
            //positive
             NSNumber * el = [[NSNumber alloc] initWithInt:RAND_FROM_TO(min, max)];
            [answerElementsArray addObject:el];
        }
    }
}


- (void)doAnswersWithMathSymbol:(int)symbol
{
    symbol = RAND_FROM_TO(0, symbol);
    
    entitySymbol = symbol;
    
    switch (symbol)
    {
        case 0:// +
            [answerMutableString appendFormat:@" + "];
            break;
        case 1:
            [answerMutableString appendFormat:@" - "];
            break;
        default:
            [answerMutableString appendFormat:@" x "];
            break;
        
    }
}

- (void)whatIsTrueQuestionWithTWOElements
{
    NSNumber * elem1 =[answerElementsArray objectAtIndex:0];
    NSNumber * elem2 =[answerElementsArray objectAtIndex:1];
 
    switch (entitySymbol)
    {
        case 0:// +
            trueQuestion = [elem1 intValue] + [elem2 intValue];
            break;
        case 1://-
            trueQuestion = [elem1 intValue] - [elem2 intValue];
            break;
        default://*
            trueQuestion = [elem1 intValue] * [elem2 intValue];
            break;
            
    }
}
- (void)questTokensAddingElementsWithMinInt:(int)i maxInt:(int)j
{
    int trueToken = arc4random()%4;
    

    
    _trueQuestionSelector = trueToken;
    
    switch (trueToken)
    {
        case 0:
            questA = trueQuestion;
            questB = RAND_FROM_TO(i, j);
            questC = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 1:
            questB = trueQuestion;
            questA = RAND_FROM_TO(i, j);
            questC = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 2:
            questC = trueQuestion;
            questA = RAND_FROM_TO(i, j);
            questB = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 3:
            questD = trueQuestion;
            questB = RAND_FROM_TO(i, j);
            questC = RAND_FROM_TO(i, j);
            questA = RAND_FROM_TO(i, j);
            break;
        default:
            break;
    }
    
    
    if (questA == questB || questA == questC || questA == questD || questB == questC || questB == questD || questC == questD)
    {
        return [self questTokensAddingElementsWithMinInt:i maxInt:j];
    }else
    {
        _questionStringA = [NSString stringWithFormat:@"%ld",(long)questA];
        _questionStringB = [NSString stringWithFormat:@"%ld",(long)questB];
        _questionStringC = [NSString stringWithFormat:@"%ld",(long)questC];
        _questionStringD = [NSString stringWithFormat:@"%ld",(long)questD];
    }
    
}
@end