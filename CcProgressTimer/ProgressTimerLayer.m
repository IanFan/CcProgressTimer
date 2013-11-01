//
//  ProgressTimerLayer.m
//  BasicCocos2D
//
//  Created by Fan Tsai Ming on 13/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgressTimerLayer.h"

@implementation ProgressTimerLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];	
	ProgressTimerLayer *layer = [ProgressTimerLayer node];
	[scene addChild: layer];
  
	return scene;
}

-(void)menuTapped:(CCMenuItemLabel*)sender {
  //default midpoint and barChangeRate
  /*
  progressTimer1.midpoint = ccp(0.5,0.5);
  progressTimer2.midpoint = ccp(0.5,0.5);
  progressTimer3.midpoint = ccp(0.5,0.5);
  progressTimer4.midpoint = ccp(0.5,0.5);
   
  progressTimer1.barChangeRate = ccp(1,1);
  progressTimer2.barChangeRate = ccp(1,1);
  progressTimer3.barChangeRate = ccp(1,1);
  progressTimer4.barChangeRate = ccp(1,1);
  */
  
  progressTimer1.midpoint = progressTimer2.midpoint = progressTimer3.midpoint = progressTimer4.midpoint = ccp(0.5,0.5);
  progressTimer1.barChangeRate = progressTimer2.barChangeRate = progressTimer3.barChangeRate = progressTimer4.barChangeRate = ccp(1,1);
  progressTimer1.midpoint = progressTimer2.midpoint = progressTimer3.midpoint = progressTimer4.midpoint = ccp(0.5,0.5);
  progressTimer1.reverseDirection = progressTimer2.reverseDirection = progressTimer3.reverseDirection = progressTimer4.reverseDirection = NO;
  
  if (sender.tag == 0) {
    progressTimer1.type = progressTimer2.type = progressTimer3.type = progressTimer4.type = kCCProgressTimerTypeRadial;
    
    [progressTimer1 runAction:[CCProgressTo actionWithDuration:5 percent:100]];
    
    progressTimer2.reverseDirection = YES;
    [progressTimer2 runAction:[CCProgressTo actionWithDuration:5 percent:100]];
    
    [progressTimer3 runAction:[CCProgressFromTo actionWithDuration:5 from:100 to:0]];
    
    progressTimer4.reverseDirection = YES;
    [progressTimer4 runAction:[CCProgressFromTo actionWithDuration:5 from:100 to:0]];
  }
  else if (sender.tag == 1) {
    progressTimer1.type = progressTimer2.type = progressTimer3.type = progressTimer4.type = kCCProgressTimerTypeBar;
    
    progressTimer1.midpoint = ccp(1, 0);
    progressTimer1.barChangeRate = ccp(1, 0);
    progressTimer1.reverseDirection = YES;
    [progressTimer1 runAction:[CCProgressFromTo actionWithDuration:5 from:100 to:0]];
    
    progressTimer2.midpoint = ccp(0, 1);
    progressTimer2.barChangeRate = ccp(0, 1);
    [progressTimer2 runAction:[CCProgressFromTo actionWithDuration:5 from:0 to:100]];
    
    [progressTimer3 runAction:[CCProgressFromTo actionWithDuration:5 from:100 to:0]];
    
    progressTimer4.midpoint = ccp(0.5, 0.5);
    progressTimer4.barChangeRate = ccp(0, 1);
    [progressTimer4 runAction:[CCProgressFromTo actionWithDuration:5 from:100 to:0]];
    
  }
  
}

#pragma mark - Setup

-(void)setMenu {
  CGSize screenSize = [CCDirector sharedDirector].winSize;
  
  NSArray *stringArray = [NSArray arrayWithObjects:
                          @"Radial",
                          @"Bar",
                          nil];
  
  NSMutableArray *meuItemLabelMutableArray = [NSMutableArray array];
  for (int i=0; i<[stringArray count]; i++) {
    int fontSize = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? 24:20;
    CCLabelTTF *labelTTF = [CCLabelTTF labelWithString:[stringArray objectAtIndex:i] fontName:@"Helvetica" fontSize:fontSize];
    CCMenuItemLabel *menuItemLabel = [CCMenuItemLabel itemWithLabel:labelTTF target:self selector:@selector(menuTapped:)];
    menuItemLabel.tag = i;
    
    [meuItemLabelMutableArray addObject:menuItemLabel];
  }
  
  CCMenu *menu = [CCMenu menuWithArray:meuItemLabelMutableArray];
  [menu alignItemsVertically];
  [menu setPosition:ccp(screenSize.width/2, screenSize.height*3/5)];
  [self addChild:menu];
  
  float scale = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? 1.0:0.8;
  
  progressTimer1 = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"square.png"]];
  [progressTimer1 setPosition:ccp(screenSize.width/5, screenSize.height*2/7)];
  progressTimer1.scale = scale;
  progressTimer1.percentage = 100;
  [self addChild:progressTimer1];
  
  progressTimer2 = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"square.png"]];
  [progressTimer2 setPosition:ccp(screenSize.width*2/5, screenSize.height*2/7)];
  progressTimer2.scale = scale;
  progressTimer2.percentage = 100;
  [self addChild:progressTimer2];
  
  progressTimer3 = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"square.png"]];
  [progressTimer3 setPosition:ccp(screenSize.width*3/5, screenSize.height*2/7)];
  progressTimer3.scale = scale;
  progressTimer3.percentage = 100;
  [self addChild:progressTimer3];
  
  progressTimer4 = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"square.png"]];
  [progressTimer4 setPosition:ccp(screenSize.width*4/5, screenSize.height*2/7)];
  progressTimer4.scale = scale;
  progressTimer4.percentage = 100;
  [self addChild:progressTimer4];
}


#pragma mark - Init

-(id) init
{
	if( (self=[super init]) ) {
    [self setMenu];
	}
  
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
