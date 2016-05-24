//
//  ViewController.m
//  IOS7-SpeechSynthesis
//
//  Created by long on 5/23/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *txtFeild;
- (IBAction)SayAction:(id)sender;

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
- (IBAction)pauseAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    
    self.txtFeild.text = @"烈日如炎，灼热的阳光从天空上倾洒下来，令得整片大地都是处于一片蒸腾之中，杨柳微垂，收敛着枝叶，恹恹不振。在那一片投射着被柳树枝叶切割而开的明亮光斑的空地中，数百道身影静静盘坐，这是一群略显青涩的少年少女，而此时，他们都是面目认真的微闭着双目，鼻息间的呼吸，呈现一种极有节奏之感，而随着呼吸的吐纳，他们的周身，仿佛是有着肉dw眼难辨的细微光芒出现";
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
//    NSLog(@"%@",[AVSpeechSynthesisVoice speechVoices]);
    
    for (AVSpeechSynthesisVoice *voice in [AVSpeechSynthesisVoice speechVoices]) {
        NSLog(@"%@ %@",voice.language, voice.name);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------
#pragma mark - Events

- (IBAction)SayAction:(id)sender {
    
    // 设置语音语言 zh-HK
    AVSpeechSynthesisVoice *spechVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-HK"];
    AVSpeechUtterance *speechUtterance = [AVSpeechUtterance speechUtteranceWithString:self.txtFeild.text];
    speechUtterance.voice = spechVoice;
//    speechUtterance.preUtteranceDelay = 5.0;
    speechUtterance.postUtteranceDelay = 3.0f;
    [self.synthesizer speakUtterance:speechUtterance];
    
    NSLog(@"%@",[AVSpeechSynthesisVoice currentLanguageCode]);
}

- (IBAction)pauseAction:(id)sender {
    
    if (self.synthesizer.speaking) {
        
        [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    }else if(self.synthesizer.paused){
        [self.synthesizer continueSpeaking];
    }else{
        
    }
   
    
}


- (IBAction)cancelAction:(id)sender {
    
    [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
#pragma mark -------------------
#pragma mark - Touch Handler
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.txtFeild canResignFirstResponder]) {
        [self.txtFeild resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

#pragma mark -------------------
#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@" didStartSpeechUtterance %@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@" didFinishSpeechUtterance %@ %@",utterance.voice.language,utterance.voice.identifier);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didPauseSpeechUtterance");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
       NSLog(@"didContinueSpeechUtterance %f %f",utterance.preUtteranceDelay,utterance.preUtteranceDelay);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    NSLog(@"didCancelSpeechUtterance");
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance{
    
     NSLog(@"willSpeakRangeOfSpeechString");
    
}

@end
