# MGCheckbox, an extendable IOS Checkbox

![Screenshot](https://raw.github.com/mattglover/MGCheckbox/master/screenie.png)

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
```objc
MGCheckbox *checkboxDefault = [MGCheckbox checkbox];
```
```objc
MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleDefault];
```
```objc
MGCheckbox *checkboxWithImages = [MGCheckbox checkboxWithOnImage:[UIImage imageNamed:@"checkbox-on"] offImage:[UIImage imageNamed:@"checkbox-off"]];
```

## Extending the 'Styles'
You can add you own style by doing the following :

Add style type (MGCheckbox.h)
```objc
typedef enum {
    CheckboxStyleDefault = 0,
    CheckboxStyleMyNewStyle = 1
} CheckboxStyle;
```

Modifying method  `+ (id)checkboxWithStyle:(CheckboxStyle)style` (MGCheckbox.m)
```objc
+ (id)checkboxWithStyle:(CheckboxStyle)style {
    
    MGCheckbox *checkbox = [[[MGCheckbox alloc] initWithFrame:CGRectZero] autorelease];
    switch (style) {
        case CheckboxStyleDefault:
            [checkbox setOffImage:[UIImage imageNamed:@"checkbox-off"]];
            [checkbox setOnImage:[UIImage imageNamed:@"checkbox-on"]];
            break;

        case CheckboxStyleMyNewStyle:
            [checkbox setOffImage:[UIImage imageNamed:@"mynewstyle-off"]];
            [checkbox setOnImage:[UIImage imageNamed:@"mynewstyle-on"]];
            break;
            
        default:
            [checkbox setOffImage:[UIImage imageNamed:@"checkbox-off"]];
            [checkbox setOnImage:[UIImage imageNamed:@"checkbox-on"]];
            break;
    }
    
    [checkbox setup];
    
    return checkbox;
}
```
and then calling 

```objc
MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleMyNewStyle];
```

## Considerations
You can use your own images (selected and unselected), however I would suggest you use the same dimensions for both.


## License

All code is licensed under the MIT license. See the LICENSE file for more details.
