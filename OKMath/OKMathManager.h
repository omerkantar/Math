//
//  OKMathManager.h
//  OKMath
//
//  Created by omer on 29/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKMathManager : NSObject

@property (nonatomic) NSInteger level;

@property (nonatomic, strong) id delegate;

- (void)changeLevel:(NSInteger)lwl;
- (void)hardAnswerTheQuestion:(NSInteger)lwl;

@end


@protocol OKMathManagerDelegate <NSObject>

- (void)okMathManagerAnswer : (NSString *)answer
                  questionA : (NSString *)questA
                  questionB : (NSString *)questB
                  questionC : (NSString *)questC
                  questionD : (NSString *)questD
          trueQuestionToken : (NSInteger )token;


@end

@interface OKMathAnswer : NSObject

@property (nonatomic) NSInteger  trueQuestionSelector;

@property (nonatomic, readonly) NSString * answerString;

@property (nonatomic, readonly) NSString * questionStringA;
@property (nonatomic, readonly) NSString * questionStringB;
@property (nonatomic, readonly) NSString * questionStringC;
@property (nonatomic, readonly) NSString * questionStringD;
- (void)createAnswerWhitLevel:(NSInteger)lwl;


@end