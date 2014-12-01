//
//  StartViewController.m
//  OKMath
//
//  Created by omer on 22/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import "StartViewController.h"
#import "OKModel.h"


@interface StartViewController ()

@end

@implementation StartViewController
{
    NSInteger scoreInteger;
    NSInteger tokenInt;
    OKMathManager * mathManager;
    NSInteger level;
    NSInteger answerNumber;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor clearColor];
    
    
 /*
  
    Bazi yapilar dah gelistirici olmasi icin kendisorusunu akiilica uretmeli
    biraz daha akilli bir yapi olusturma yoluna gittim
    level yapisini score gore degilde soru sayisi uzerine gidilmeli
    onedenle 2 3 5 5 5 ... 5 seklinde bir algoritma olusturucagim
    yani ilk iki soruda level 0 sonra 1 5.soruda 2 10.soruda 3 sonraki 15.soruda 4 ve boyle artmali
    ve levele gorede her sorunun verecegi score farkli olacak
  
  */
    self.answerLabel.layer.cornerRadius = 10.0f;
    self.buttonA.layer.cornerRadius = 10.0f;
    self.buttonB.layer.cornerRadius = 10.0f;
    self.buttonC.layer.cornerRadius = 10.0f;
    self.buttonD.layer.cornerRadius = 10.0f;
    
    scoreInteger = 0;
    level = 0;
    answerNumber = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"score : 0"];
    
    _scoreLabel.text = [NSString stringWithFormat:@"level : %ld",(long)scoreInteger];
    
//    answer = [[OKAnswer alloc] init];
    
//    [answer answerWithScore:scoreInteger];
    
//    [self answerTheQuestion];
    
    mathManager = [[OKMathManager alloc] init];
    mathManager.delegate = self;
//    mathManager 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - uidesign
- (void)answerTheQuestion
{

}

- (void)startTimer
{
    
    
}

#pragma mark - Action
- (IBAction)buttonActionA:(id)sender {
    if(tokenInt == 0)
    {
        //True
        [self trueQuestion];
    }
    
}

- (IBAction)buttonActionB:(id)sender {
    if(tokenInt == 1)
    {
        //True
        [self trueQuestion];

    }
}

- (IBAction)buttonActionC:(id)sender {
    if(tokenInt == 2)
    {
        //True
        [self trueQuestion];

    }
}

- (IBAction)buttonActionD:(id)sender {
    if(tokenInt == 3)
    {
        //True
        [self trueQuestion];

    }
}
#pragma mark - Questions Methods
- (void)trueQuestion
{
    scoreInteger +=10;
    answerNumber++;
    
    self.scoreLabel.text= [NSString stringWithFormat:@"score :%ld",(long)scoreInteger];
    
//    [answer answerWithScore:scoreInteger];
    [self findLevelWithAnswerNumber];
    
    [mathManager changeLevel:level];
    
    
}

- (void)okMathManagerAnswer:(NSString *)answer questionA:(NSString *)questA questionB:(NSString *)questB questionC:(NSString *)questC questionD:(NSString *)questD trueQuestionToken:(NSInteger)token
{
    [self.buttonA setTitle:questA forState:UIControlStateNormal];
    [self.buttonB setTitle:questB forState:UIControlStateNormal];
    [self.buttonC setTitle:questC forState:UIControlStateNormal];
    [self.buttonD setTitle:questD forState:UIControlStateNormal];
    [self.answerLabel setText:answer];
    tokenInt = token;
}

- (void)findLevelWithAnswerNumber
{
    switch (answerNumber)
    {
        case 0:
            level = 0;
            break;
        case 2:
            level = 1;
            break;
        case 5:
            level = 2;
            break;
        case 8:
            level = 3;
            break;
        case 10:
            level = 4;
            break;
        case 12:
            level = 5;
            break;
        case 15:
            level = 6;
            break;
        case 18:
            level = 7;
            break;
        case 20:
            level = 8;
            break;
        case 22:
            level = 9;
            break;
        case 24:
            level = 10;
            break;
        case 26:
            level = 11;
            break;
        case 25:
            level = 12;
            break;
        case 28:
            level = 13;
            break;
        case 30:
            level++;
            break;
            
        default:
            break;
    }
    
    if(level >13)
    {
        level++; // quest combinasion
    }
    
}

@end
