# MGCheckbox, an extendable IOS Checkbox

## Framework Dependancies
MGCheckbox has a dependancy on QuartzCore framework, please make sure to include QuartzCore.framework within the 'Link Binary with Libraries' section under your Build Phases.

## Usage
I have tried to make it easy to use MGCheckbox by providing 3 convenience methods.

```objc
+ (id)checkbox;
+ (id)checkboxWithStyle:(CheckboxStyle)style;
+ (id)checkboxWithOnImage:(UIImage *)onImage offImage:(UIImage *)offImage;
```
### Examples
1.
```objc
MGCheckbox *checkboxDefault = [MGCheckbox checkbox];
```
2.
```objc
MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleDefault];
```
3.
```objc
MGCheckbox *checkboxWithImages = [MGCheckbox checkboxWithOnImage:[UIImage imageNamed:@"checkbox-on"] offImage:[UIImage imageNamed:@"checkbox-off"]];
```

## License

All code is licensed under the MIT license. See the LICENSE file for more details.
