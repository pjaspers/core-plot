
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@class CPColor;

@interface CPTextStyle : NSObject <NSCopying, NSCoding> {
	@private
    NSString *fontName;
	 CGFloat fontSize;
    CPColor *color;
    CPColor   *shadowColor; // default is nil (no shadow)
	 CGSize     shadowOffset; // default is CGSizeMake(0, -1) -- a top shadow
}

@property(readwrite, copy, nonatomic) NSString *fontName;
@property(readwrite, assign, nonatomic) CGFloat fontSize; 
@property(readwrite, copy, nonatomic) CPColor *color;
@property(readwrite, copy, nonatomic) CPColor *shadowColor;
@property(readwrite, assign, nonatomic) CGSize shadowOffset; 

/// @name Factory Methods
/// @{
+(CPTextStyle *)textStyle;
///	@}

@end

/**	@category NSString(CPTextStyleExtensions)
 *	@brief NSString extensions for drawing styled text.
 **/
@interface NSString(CPTextStyleExtensions)

/// @name Measurement
/// @{
-(CGSize)sizeWithTextStyle:(CPTextStyle *)style;
///	@}

/// @name Drawing
/// @{
-(void)drawAtPoint:(CGPoint)point withTextStyle:(CPTextStyle *)style inContext:(CGContextRef)context;
///	@}

@end
