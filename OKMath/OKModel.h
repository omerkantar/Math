//
//  OKModel.h
//  OKMath
//
//  Created by omer on 22/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OKUser : NSObject
//
// user best score in NSUserDefaults
// allUser best score in server best user
//
{
    NSUserDefaults * userDefault;
}



@property (nonatomic, readonly) NSString * userBestScore;

@property (nonatomic, strong) NSString * allUserBestScore;



@end


@interface OKAnswer : NSObject

@property (nonatomic, readonly) NSString * okAnswer;

@property (nonatomic,readonly) NSUInteger tokenInt; // trueToken

@property (nonatomic, readonly) NSString * okQuestionA;
@property (nonatomic, readonly) NSString * okQuestionB;
@property (nonatomic, readonly) NSString * okQuestionC;
@property (nonatomic, readonly) NSString * okQuestionD;


- (void)answerWithScore:(NSInteger)score;


@end