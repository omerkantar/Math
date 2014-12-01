//
//  StartViewController.h
//  OKMath
//
//  Created by omer on 22/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKMathManager.h"

@interface StartViewController : UIViewController<OKMathManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UIButton *buttonA;
@property (strong, nonatomic) IBOutlet UIButton *buttonB;
@property (strong, nonatomic) IBOutlet UIButton *buttonC;
@property (strong, nonatomic) IBOutlet UIButton *buttonD;

- (IBAction)buttonActionA:(id)sender;
- (IBAction)buttonActionB:(id)sender;
- (IBAction)buttonActionC:(id)sender;
- (IBAction)buttonActionD:(id)sender;



@end
