//
//  MGCheckbox.h
//  MGCheckbox
//
//  Created by Matt Glover on 27/09/2012.
//  Copyright (c) 2012 Duchy Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MGCheckbox;
@protocol MGCheckboxDelegate <NSObject>
@optional
- (void)checkbox:(MGCheckbox *)checkbox didChangeState:(BOOL)selected;
@end

typedef enum {
  CheckboxStyleDefault = 0
} CheckboxStyle;

@interface MGCheckbox : UIControl

@property (nonatomic, assign) id<MGCheckboxDelegate> delegate;
@property (nonatomic, assign) BOOL pulseOnSelect; // Defaults to YES

+ (id)checkbox;
+ (id)checkboxWithStyle:(CheckboxStyle)style;
+ (id)checkboxWithOnImage:(UIImage *)onImage offImage:(UIImage *)offImage;



@end
