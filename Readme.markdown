# SAMCircleProgressView

Determinate, circular progress view.

SAMCircleProgressView is tested on iOS 6 and requires ARC. Released under the [MIT license](LICENSE).

## Example

![SAMCircleProgressView animated](http://soff.me/UR2z/Example.gif)

Open up the included Xcode project for an example app.

## Usage

``` objc
SAMCircleProgressView *progressView = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 55.0f, 55.0f)];
	progressView.progress = 0.25;
[self.view addSubview:progressView];
```

See the [header](SAMCircleProgressView/SAMCircleProgressView.h) for full documentation.

## Installation

Simply add the files in the `SAMCircleProgressView` to your project or add `SAMCircleProgressView ` to your Podfile if you're using CocoaPods.
