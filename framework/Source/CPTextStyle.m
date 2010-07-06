
#import "CPTextStyle.h"
#import "CPColor.h"

/** @brief Wrapper for various text style properties.
 **/

@implementation CPTextStyle

/** @property fontSize
 *  @brief Sets the font size.
 **/
@synthesize fontSize;

/** @property fontName
 *  @brief Sets the font name.
 **/
@synthesize fontName;

/** @property color
 *  @brief Sets the current text color.
 **/
@synthesize color;

/** @property shadowColor
 *  @brief Sets the current shadow color.
 **/
@synthesize shadowColor;

/** @property shadowOffset
 *  @brief Sets the current shadow size.
 **/
@synthesize shadowOffset;

#pragma mark -
#pragma mark Initialization and teardown

-(id)init 
{
	if ( self = [super init] ) {
		fontName = @"Helvetica";
		fontSize = 12.0;
		shadowColor = nil;
		shadowOffset = CGSizeMake(0, -1);
		color = [[CPColor blackColor] retain];
	}
	return self;
}

-(void)dealloc
{
	[fontName release];
	[color release];
	[super dealloc];
}

#pragma mark -
#pragma mark Factory Methods

/** @brief Creates and returns a new CPTextStyle instance.
 *  @return A new CPTextStyle instance.
 **/
+(CPTextStyle *)textStyle
{
	return [[[self alloc] init] autorelease];
}

#pragma mark -
#pragma mark Copying

-(id)copyWithZone:(NSZone *)zone 
{
	CPTextStyle *newCopy = [[CPTextStyle allocWithZone:zone] init];
	newCopy->fontName = [self->fontName copy];
	newCopy->color = [self->color copy];
	newCopy->fontSize = self->fontSize;
	newCopy->shadowColor = [self->shadowColor copy];
	newCopy->shadowOffset = self->shadowOffset;
	return newCopy;
}

#pragma mark -
#pragma mark NSCoding methods

-(void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.fontName forKey:@"fontName"];
	[coder encodeDouble:self.fontSize forKey:@"fontSize"];
	[coder encodeObject:self.color forKey:@"color"];
	[coder encodeObject:self.shadowColor forKey:@"shadowColor"];
	//[coder encodeCGSize:self.shadowOffset forKey:@"shadowOffset"];
}

-(id)initWithCoder:(NSCoder *)coder
{
	self = [super init];
    
    if (self) {
		self.fontName = [coder decodeObjectForKey:@"fontName"];
		self.fontSize = [coder decodeDoubleForKey:@"fontSize"];
		self.color = [coder decodeObjectForKey:@"color"];
		self.shadowColor = [coder decodeObjectForKey:@"shadowColor"];
		//self.shadowOffset = [coder decodeCGSizeForKey:@"shadowOffset"];
	}
    return self;
}

@end
