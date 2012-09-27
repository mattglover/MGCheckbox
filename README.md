# MGCheckbox, an extendable IOS Checkbox Objective-C

## Framework Dependancies
MGCheckbox has a dependancy on QuartzCore framework, please make sure to include QuartzCore.framework within the 'Link Binary with Libraries' section under your Build Phases.

## Example Usage
I have tried to make it easy to use MGCheckbox by providing 3 convenience methods.
```objc
MGCheckbox *checkboxDefault = [MGCheckbox checkbox];
```

```objc
MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleDefault];
```

```objc
MGCheckbox *checkboxWithImages = [MGCheckbox checkboxWithOnImage:[UIImage imageNamed:@"checkbox-on"] offImage:[UIImage imageNamed:@"checkbox-off"]];
```



The latest release is 1.4. A list of changes can be found in the [CHANGELOG](CHANGELOG.md).

## License

All code is licensed under the MIT license. See the LICENSE file for more details.
