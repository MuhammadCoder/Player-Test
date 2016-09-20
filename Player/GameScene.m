//
//  GameScene.m
//  Player
//
//  Created by Muhammad  on 2016-09-19.
//  Copyright © 2016 Muhammad . All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
    SKSpriteNode *player;
    SKShapeNode * right;
    SKShapeNode * left;
    SKShapeNode * up;
    BOOL pressed;

}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    
    self.backgroundColor = [SKColor colorWithRed:0.54 green:0.7853 blue:1.0 alpha:1.0];
    [self ground];
    [self player];
    [self buttons];
}

-(void)ground {
    
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(self.frame.size.width, 100)];
    ground.position = CGPointMake(0, -170);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    [self addChild:ground];
}

-(void)player
{
    /*creating the player */
    
    player = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(50, 50)];
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.affectedByGravity = YES;
    
    /*creating the left eye */
    
    SKSpriteNode * leftEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
     leftEye.position = CGPointMake(-3, 8);
    
    [player addChild:leftEye];
    
    /*creating right eye */
    
    SKSpriteNode * rightEye = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(5, 5)];
    rightEye.position = CGPointMake(12, 8);
    
    [player addChild:rightEye];
    
    [self addChild:player];


}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [player removeAllActions];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self nodeTouched:location];
    }
}

-(void)buttons
{
    right = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    right.fillColor = [UIColor grayColor];
    right.position = CGPointMake(-200, -180);
    right.name = @"right";
    [self addChild:right];
    
    up = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    up.fillColor = [UIColor grayColor];
    up.position = CGPointMake(-150, -180);
    up.name = @"up";
    
    left = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    left.fillColor = [UIColor grayColor];
    left.position = CGPointMake(-330, -180);
    left.name = @"left";
    [self addChild:left];
    
    
}

-(void)nodeTouched:(CGPoint)touched
{
    SKNode *touches = [self nodeAtPoint:touched];
    
    if ([touches.name isEqualToString:@"right"])
    {
        NSLog(@"Right was pressed");
        SKAction *movePlayer = [SKAction moveByX:10 y:0 duration:0.1];
        [player runAction:[SKAction repeatActionForever:movePlayer]];
    }
    else if ([touches.name isEqualToString:@"left"])
    {
        SKAction *movePlayer = [SKAction moveByX:-10 y:0 duration:0.1];
        [player runAction:[SKAction repeatActionForever:movePlayer]];
    }
    
   /* else if ([touches.name isEqualToString:@"up"])
    {
        // SKAction *movePlayer = [SKAction moveToY:20 duration:30];
        //[player runAction:[SKAction repeatActionForever:movePlayer]];
    }
    */
    
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
