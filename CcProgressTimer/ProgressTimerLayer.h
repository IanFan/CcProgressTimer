//
//  ProgressTimerLayer.h
//  BasicCocos2D
//
//  Created by Fan Tsai Ming on 13/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface ProgressTimerLayer : CCLayer
{
  CCProgressTimer *progressTimer1;
  CCProgressTimer *progressTimer2;
  CCProgressTimer *progressTimer3;
  CCProgressTimer *progressTimer4;
}

+(CCScene *) scene;

@end
