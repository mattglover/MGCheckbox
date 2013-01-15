//
//  MGCheckbox.m
//  MGCheckbox
//
//  Created by Matt Glover on 27/09/2012.
//  Copyright (c) 2012 Duchy Software Ltd. All rights reserved.
//

#import "MGCheckbox.h"
#import <QuartzCore/QuartzCore.h>

@interface MGCheckbox ()
@property (nonatomic, retain) UIImageView *checkboxImageView;
@property (nonatomic, assign) CheckboxStyle *style;

@property (nonatomic, retain) UIImage *onImage;
@property (nonatomic, retain) UIImage *offImage;

- (void)setup;
- (void)handleTouchEvent;
- (void)updateCheckbox:(BOOL)checked;
@end


@implementation MGCheckbox
@synthesize delegate = _delegate;
@synthesize onImage = _onImage;
@synthesize offImage = _offImage;
@synthesize style = _style;
@synthesize checkboxImageView = _checkboxImageView;
@synthesize pulseOnSelect = _pulseOnSelect;

+ (void)initialize {
  //    [super initialize];
}

+ (id)checkbox {
  return [self checkboxWithStyle:CheckboxStyleDefault];
}

+ (id)checkboxWithOnImage:(UIImage *)onImage offImage:(UIImage *)offImage {
  
  MGCheckbox *checkbox = [[[MGCheckbox alloc] initWithFrame:CGRectZero] autorelease];
  [checkbox setOffImage:offImage];
  [checkbox setOnImage:onImage];
  [checkbox setup];
  
  return checkbox;
}

+ (id)checkboxWithStyle:(CheckboxStyle)style {
  
  MGCheckbox *checkbox = [[[MGCheckbox alloc] initWithFrame:CGRectZero] autorelease];
  switch (style) {
    case CheckboxStyleDefault:
      [checkbox setOffImage:[UIImage imageNamed:@"checkbox-off"]];
      [checkbox setOnImage:[UIImage imageNamed:@"checkbox-on"]];
      break;
      
    default:
      [checkbox setOffImage:[UIImage imageNamed:@"checkbox-off"]];
      [checkbox setOnImage:[UIImage imageNamed:@"checkbox-on"]];
      break;
  }
  
  [checkbox setup];
  
  return checkbox;
}

- (void)dealloc{
  [_onImage release];
  [_offImage release];
  [_checkboxImageView release];
  
  [super dealloc];
}

#pragma mark - Setup
- (void)setup {
  self.backgroundColor = [UIColor clearColor];
  self.enabled = YES;
  self.pulseOnSelect = YES;
  
  self.checkboxImageView = [[[UIImageView alloc] initWithImage:self.offImage] autorelease];
  [self.checkboxImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
  self.bounds = self.checkboxImageView.bounds;
  
  [self addTarget:self action:@selector(handleTouchEvent) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.checkboxImageView];
}

#pragma mark - Touch Listener
- (void)handleTouchEvent {
  self.selected = !self.selected;
  
  [self updateCheckbox:self.isSelected];
}

#pragma mark - Display update
- (void)updateCheckbox:(BOOL)checked {
  
  if(checked) {
    if(self.pulseOnSelect) {
      [UIView animateWithDuration:0.05
                       animations:^{
                         [self.checkboxImageView setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
                       } completion:^(BOOL finished){
                         [UIView animateWithDuration:0.05
                                          animations:^{
                                            [self.checkboxImageView setTransform:CGAffineTransformIdentity];
                                          }];
                         [self.checkboxImageView setImage:self.onImage];
                       }];
    } else {
      [self.checkboxImageView setImage:self.onImage];
    }
  } else {
    [self.checkboxImageView setImage:self.offImage];
  }
  
  [self.delegate checkbox:self didChangeState:self.selected];
}

@end