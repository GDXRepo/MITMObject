# MITMObject

MITMObject can be used to subclass Foundation classes with overriding system delegate methods.

## Adding MITMObject to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add MITMObject to your project.

1. Add a pod entry for MITMObject to your Podfile `pod 'MITMObject'`
2. Install the pod(s) by running `pod install`.
3. Include MITMObject wherever you need it with `#import "MITMObject.h"`.

### Source files

Alternatively you can directly add the `MITMObject.h` and `MITMObject.m` source files to your project.

1. Download the [latest code version](https://github.com/NRGRepo/MITMObject/archive/master.zip) or add the repository as a git submodule to your git-tracked project. 
2. Open your project in Xcode, then drag and drop `MITMObject.h` and `MITMObject.m` onto your project (use the "Project Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 
3. Include MITMObject wherever you need it with `#import "MITMObject.h"`.

## Usage

At first you should subclass any another class with delegate methods inside which you want to override. For example, let's override UIScrollView class:

```objective-c
// MyScrollView.h

#import <UIKit/UIKit.h>

@interface MyScrollView : UIScrollView

@end

// MyScrollView.m

#import "MyScrollView.h"

@implementation MyScrollView

@end
```

Next, add MITMObject class instance to your subclass private section, like this:

```objective-c
// MyScrollView.m

#import "MyScrollView.h"
#import "MITMObject.h"

@interface MyScrollView () {
	MITMObject *mitm;
}

@end

@implementation MyScrollView

@end
```

Then you should implement an initializer which you will use and call `MITM_INIT(mitm)` macro inside it. For a UIScrollView subclass which will be used in Interface Builder it's necessary to implement `initWithCoder:` initializer. Also call `MITM_IMPLEMENT(mitm)` macro right before writing any implementation logic. Resulting code may look like this:

```objective-c
// MyScrollView.m

#import "MyScrollView.h"
#import "MITMObject.h"

@interface MyScrollView () {
	MITMObject *mitm;
}

@end

@implementation MyScrollView

MITM_IMPLEMENT(mitm);

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        MITM_INIT(mitm);
        
        // your own initializations...
        // ...
    }
    return self;
}

@end
```
After that you are free to override any delegate methods from your parent class, just don't forget to make forward calls in your own implementations. For example, overridden `scrollViewDidScroll:` method may look like this:

```objective-c
// MyScrollView.m

#import "MyScrollView.h"
#import "MITMObject.h"

@interface MyScrollView () {
	MITMObject *mitm;
}

@end

@implementation MyScrollView

MITM_IMPLEMENT(mitm);

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        MITM_INIT(mitm);
        
        // your own initializations...
        // ...
    }
    return self;
}

#pragma mark - MITM Overrides

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // your own implementation
    // ...
    
    // forward call
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

@end
```

## Samples

You can find sample application in the `Samples` folder.

## License

Apache. See `LICENSE` for details.
