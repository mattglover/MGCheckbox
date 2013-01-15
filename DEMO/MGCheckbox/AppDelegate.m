//
//  AppDelegate.m
//  MGCheckbox
//
//  Created by Matt Glover on 27/09/2012.
//  Copyright (c) 2012 Duchy Software Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "MGCheckbox.h"

@interface AppDelegate () <MGCheckboxDelegate>

@end

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  
  // Checkbox using Delegate callback rather than UIControlEvent
  MGCheckbox *checkboxDefault = [MGCheckbox checkbox];
  [checkboxDefault setCenter:CGPointMake(240, 100)];
 // [checkboxDefault addTarget:self action:@selector(checkBoxValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  [checkboxDefault setDelegate:self];
  UILabel *checkboxDefaultLabel = [self checkboxLabelWithLabelText:@"checkboxDefault"];
  [checkboxDefaultLabel setCenter:CGPointMake(90, checkboxDefault.center.y)];
  
  [self.window addSubview:checkboxDefaultLabel];
  [self.window addSubview:checkboxDefault];
  
  
  // Checkbox using standard target/action
  MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleDefault];
  [checkboxWithStyle setCenter:CGPointMake(240, 180)];;
  [checkboxWithStyle addTarget:self action:@selector(checkBoxValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  UILabel *checkboxWithStyleLabel = [self checkboxLabelWithLabelText:@"checkboxWithStyle"];
  [checkboxWithStyleLabel setCenter:CGPointMake(90, checkboxWithStyle.center.y)];
  [self.window addSubview:checkboxWithStyleLabel];
  [self.window addSubview:checkboxWithStyle];
  
  
  // Checkbox using standard target/action
  MGCheckbox *checkboxWithImages = [MGCheckbox checkboxWithOnImage:[UIImage imageNamed:@"checkbox-on"] offImage:[UIImage imageNamed:@"checkbox-off"]];
  [checkboxWithImages setCenter:CGPointMake(240, 260)];;
  [checkboxWithImages addTarget:self action:@selector(checkBoxValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  UILabel *checkboxWithImagesLabel = [self checkboxLabelWithLabelText:@"checkboxWithImages"];
  [checkboxWithImagesLabel setCenter:CGPointMake(90, checkboxWithImages.center.y)];
  [self.window addSubview:checkboxWithImagesLabel];
  [self.window addSubview:checkboxWithImages];
  
  
  // Checkbox using standard target/action
  MGCheckbox *checkboxDefaultNoPulseOnSelect = [MGCheckbox checkbox];
  [checkboxDefaultNoPulseOnSelect setCenter:CGPointMake(240, 340)];
  [checkboxDefaultNoPulseOnSelect setPulseOnSelect:NO];;
  [checkboxDefaultNoPulseOnSelect addTarget:self action:@selector(checkBoxValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  UILabel *checkboxDefaultNoPulseOnSelectLabel = [self checkboxLabelWithLabelText:@"checkboxDefault-NoPulse"];
  [checkboxDefaultNoPulseOnSelectLabel setCenter:CGPointMake(90, checkboxDefaultNoPulseOnSelect.center.y)];
  [self.window addSubview:checkboxDefaultNoPulseOnSelectLabel];
  [self.window addSubview:checkboxDefaultNoPulseOnSelect];
  
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)checkBoxValueChanged:(id)sender {
  // handle checkbox value change
  NSLog(@"handle checkbox value change here");
}

// Helper Method for the Label
- (UILabel *)checkboxLabelWithLabelText:(NSString *)labelText {
  
  UILabel *checkboxLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)] autorelease];
  [checkboxLabel setBackgroundColor:[UIColor clearColor]];
  [checkboxLabel setTextAlignment:UITextAlignmentRight];
  [checkboxLabel setText:labelText];
  [checkboxLabel setTextColor:[UIColor blackColor]];
  [checkboxLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
  
  return checkboxLabel;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - MGCheckbox Delegate
-(void)checkbox:(MGCheckbox *)checkbox didChangeState:(BOOL)selected {
  NSLog(@"Checkbox:%@, did change selection: %d", checkbox, selected);
}

@end
