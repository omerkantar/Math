//
//  OKModel.m
//  OKMath
//
//  Created by omer on 22/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import "OKModel.h"
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@implementation OKUser


- (id)init
{
    if(self)
    {
        [self callUserBestScore];
    }
    
    return self;
}

- (void)callUserBestScore
{
    _userBestScore = [userDefault objectForKey:@"userScore"];
    
    if(_userBestScore == nil)
    {
        _userBestScore = 0;
    }
}

@end


@implementation OKAnswer

{
    NSUInteger level;
    
    // Answer entities
    NSInteger entity1;
    NSInteger entity2;
    NSInteger entity3;
    NSInteger entity4;
    
    // okAnswer = @"entity1 + entity2";
    //true integer = entity1+entity2
    NSInteger trueInt;
    //TrueInt tmp1 + true int tmp2 there hard answers
    NSInteger tmp1,tmp2;
    
    NSInteger questA;
    NSInteger questB;
    NSInteger questC;
    NSInteger questD;
    // true element token
    int trueToken;
    
    NSMutableString * answerMutableString;
}



#pragma mark - answer methods
- (void)doAnswerWithInt:(int)i symbol:(int)j
{
    //easy answer
    entity1 = arc4random()%i;
    entity2 = arc4random()%i;
    
    switch (j) {
        case 0:
            trueInt = entity1 + entity2;
            break;
        case 1:
            trueInt = entity1 - entity2;
            break;
        case 2:
            trueInt = entity1 * entity2;
            break;
        default:
            trueInt = entity1 / entity2;
            break;
    }
  
}
- (void)doHardAnswerWithMaxInt:(int)i minInt:(int)t  symbol1:(int)j symbol2:(int)k symbol3:(int)m
{
    answerMutableString = [NSMutableString new];
    
    entity1 = RAND_FROM_TO(t, i);
    entity2 = RAND_FROM_TO(t, i);
    entity3 = RAND_FROM_TO(t, i);
    entity4 = RAND_FROM_TO(t, i);
    
    trueInt = 0;tmp1 = 0;tmp2 = 0;
    
    // if m == -1 hard
    // else very hard answer
    
    
    NSString* element1= [NSString stringWithFormat:@"%ld",(long)entity1];
    NSString* element2= [NSString stringWithFormat:@"%ld",(long)entity2];
    NSString* element3= [NSString stringWithFormat:@"%ld",(long)entity3];
    NSString* element4= [NSString stringWithFormat:@"%ld",(long)entity4];

    [answerMutableString stringByAppendingFormat:@"(%@",element1];
    
    [self whatIsMathSymbol:j];
    
    [answerMutableString stringByAppendingFormat:@"%@)",element2];
    
    [self whatIsMathSymbol:k];
    
    
    [self whatIsMathSymbol:j entity1:entity1 entity2:entity2];
    
    if (m == -1)
    {
        //hard
        
        [answerMutableString stringByAppendingFormat:@"%@",element3];
        
        [self findTrueIntWithMathSymbol:k control:m];
        
    }else
    {
        //very hard
        // m 0 1 2 3
        
        // use k
        [self whatIsMathSymbol:k entity1:entity3 entity2:entity4];
        
        [answerMutableString stringByAppendingFormat:@"(%@",element3];
        // use m
        [self findTrueIntWithMathSymbol:m control:m];
        
        [self whatIsMathSymbol:m];
        
        [answerMutableString stringByAppendingFormat:@"%@)",element4];
    }
    
    _okAnswer = [NSString stringWithFormat:@"%@",answerMutableString];
    
}

- (void)whatIsMathSymbol:(int)symbol
{
    switch (symbol) {
        case 0:// +
            [answerMutableString stringByAppendingFormat:@" + "];
            break;
        case 1:
            [answerMutableString stringByAppendingFormat:@" - "];
            break;
        case 2:
            [answerMutableString stringByAppendingFormat:@" x "];
            break;
        default:
            [answerMutableString stringByAppendingFormat:@" : "];
            break;
    }
}

- (void)whatIsMathSymbol:(int)symbol entity1:(NSInteger)e1 entity2:(NSInteger)e2
{
    if(trueInt == 0)
    {
        switch (symbol) {
            case 0:// +
                tmp1 = (e1 + e2);
                break;
            case 1:
                tmp1 = (e1 - e2);
                break;
            case 2:
                tmp1 =  e1 * e2;
                break;
            default:
                tmp1 =  e1 / e2;
                break;
        }
   
    }else
    {
            //there using tmp2 very hard answer
        switch (symbol) {
            case 0:// +
                tmp2 = (e1 + e2);
                break;
            case 1:
                tmp2 = (e1 - e2);
                break;
            case 2:
                tmp2 =  e1 * e2;
                break;
            default:
                tmp2 =  e1 / e2;
                break;
        }
        
    }
    
}

- (void)findTrueIntWithMathSymbol:(int)symbol control:(int)c
{
    if(c == -1)
    {
        
        switch (symbol) {
            case 0:// +
                trueInt = tmp1 + entity3;
                break;
            case 1:
                trueInt = tmp1 - entity3;
                break;
            case 2:
                trueInt = tmp1 * entity3;
                break;
            default:
                trueInt = tmp1 / entity3;
                break;
        }
        
    }else
    {
        switch (symbol) {
            case 0:// +
                trueInt = tmp1 + tmp2;
                break;
            case 1:
                trueInt = tmp1 - tmp2;
                break;
            case 2:
                trueInt = tmp1 * tmp2;
                break;
            default:
                trueInt = tmp1 / tmp2;
                break;
        }

    }
}


- (void)answerWithScore:(NSInteger)score
{
    //Math Levels
    //Level 1 Easy score < 10
    //Level 2 Easy score < 20
    //Level 3
    int dynamicInt;
    if(score < 10)
    {
        //There easy answer
        // 3+4
        level = 1;
        
        
        [self doAnswerWithInt:10 symbol:0];
        
        
        NSLog(@"%lu %lu",(long)entity1,(long)entity2);
        
        _okAnswer = [NSString stringWithFormat:@"%ld + %ld",(long)entity1,(long)entity2];
        
        [self questTokensAddingElementsWithMinInt:0 maxInt:25];
        
    }else if(score >= 10 && score < 30)
    {
        //There camming negative numbers
        //3-4
        level = 2;
        
        int math = arc4random()%2;
        //math == 0 addition
        //math == 1 negative down
        [self mathControllerWithMath:math hightInt:45 minInt:5];
        
    }else if(score >= 30 && score < 50)
    {
        //There camming multiply * X
        //3X4
        level = 3;
        int math = arc4random()%3;
        [self mathControllerWithMath:math hightInt:65 minInt:10];
        
    }else if(score >= 50 && score <70)
    {
        //There camming division
        //3:4
        level = 4;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:75 minInt:15];
        
        
    }else if(score >= 70 && score <100)
    {
        //double ( + ) - numbers 10 - 50
        level = 5;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:35 minInt:-35];

    }else if (score >= 100 && score < 150)
    {
        level = 6;
        // ( + veya - ) * numbers 20 - 80
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:70 minInt:-70];

    }else if(score >= 150 && score <250)
    {
        level = 7;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:105 minInt:-105];
    }else if(score >= 250 && score < 350)
    {
        level = 8;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:155 minInt:-155];

    }else if(score >= 350 && score < 450)
    {
        level = 9;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:350 minInt:-350];
        dynamicInt = 10;
    }else if(score >= 450 && score < 550)
    {
        level = 10;
        int math = arc4random()%4;
        [self mathControllerWithMath:math hightInt:500 minInt:-550];
        
    }else if(score >= 550 && score < 750)
    {
        level = 11;
        [self mathControllerWithMath:4 hightInt:650 minInt:-650];
        
    }else if(score >= 750 && score < 950)
    {
        // (- veya + ) * (- veya + ) hight numbers 100 200
        level = 12;
        dynamicInt += 1;
        [self mathControllerWithMath:4 hightInt:150+dynamicInt minInt:-150-dynamicInt];
        
    }else if(score >= 950 && score < 1050)
    {
        // (- veya + ) * (- veya + ) hight numbers 100 200
        level = 13;
        dynamicInt += 2;
        [self mathControllerWithMath:4 hightInt:350+dynamicInt minInt:-250-dynamicInt];
        
    }else if(score >= 1050 && score < 1150)
    {
        // (- veya + ) * (- veya + ) hight numbers 100 200
        level = 14;
        dynamicInt += 3;
        [self mathControllerWithMath:4 hightInt:550+dynamicInt minInt:-350-dynamicInt];
        
    }else if(score >= 1150 && score < 1350)
    {
        // (- veya + ) * (- veya + ) hight numbers 100 200
        level = 15;
        dynamicInt += 3;
        [self mathControllerWithMath:4 hightInt:650+dynamicInt minInt:-450-dynamicInt];
        
    }else if (score >= 1350 && score < 1550)
    {
        level = 16;
        dynamicInt += 1;
        [self mathControllerWithMath:5 hightInt:1050+dynamicInt minInt:-1150-dynamicInt];
    }else if (score >= 1550)
    {
        if (score == 1550) {
            dynamicInt = 10;
        }
        
        dynamicInt += 1;
        [self mathControllerWithMath:5 hightInt:1350+dynamicInt minInt:-1350-dynamicInt];
        level++;
    }
}


#pragma mark - controll
- (void)mathControllerWithMath:(int)i hightInt:(int)j minInt:(int)k
{
    int symbol1 = i;
    int symbol2 = arc4random()%4;
    int symbol3 = arc4random()%4;
    switch (i)
    {
        case 0:
            //+
            [self doAnswerWithInt:j symbol:i];
            _okAnswer = [NSString stringWithFormat:@"%ld + %ld",(long)entity1,(long)entity2];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        case 1:
            //-
            [self doAnswerWithInt:j symbol:i];
            _okAnswer = [NSString stringWithFormat:@"%ld - %ld",(long)entity1,(long)entity2];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        case 2:
            //*
            [self doAnswerWithInt:j symbol:i];
            _okAnswer = [NSString stringWithFormat:@"%ld x %ld",(long)entity1,(long)entity2];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        case 3:
            // :
            [self doAnswerWithInt:j symbol:i];
            _okAnswer = [NSString stringWithFormat:@"%ld : %ld",(long)entity1,(long)entity2];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        case 4:
            // hard
            [self doHardAnswerWithMaxInt:j minInt:k symbol1:symbol1 symbol2:symbol2 symbol3:-1];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        case 5:
            // very hard
            [self doHardAnswerWithMaxInt:j minInt:k symbol1:symbol1 symbol2:symbol2 symbol3:symbol3];
            [self questTokensAddingElementsWithMinInt:k maxInt:j];
            break;
        default:
            break;
    }
}

#pragma mark questToken method
- (void)questTokensAddingElementsWithMinInt:(int)i maxInt:(int)j
{
    trueToken = arc4random()%4;
    
    _tokenInt = trueToken;
    

    
    switch (trueToken)
    {
        case 0:
            questA = trueInt;
            questB = RAND_FROM_TO(i, j);
            questC = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 1:
            questB = trueInt;
            questA = RAND_FROM_TO(i, j);
            questC = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 2:
            questC = trueInt;
            questA = RAND_FROM_TO(i, j);
            questB = RAND_FROM_TO(i, j);
            questD = RAND_FROM_TO(i, j);
            break;
        case 3:
            questD = trueInt;
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
        _okQuestionA = [NSString stringWithFormat:@"%ld",(long)questA];
        _okQuestionB = [NSString stringWithFormat:@"%ld",(long)questB];
        _okQuestionC = [NSString stringWithFormat:@"%ld",(long)questC];
        _okQuestionD = [NSString stringWithFormat:@"%ld",(long)questD];
    }
    
}



@end