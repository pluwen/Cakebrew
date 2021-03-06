//
//  BPStyle.h
//  Cakebrew
//
//  Created by Marek Hrusovsky on 25/08/15.
//	Copyright (c) 2014 Bruno Philipe. All rights reserved.
//
//	This program is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
//
//	This program is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU General Public License
//	along with this program.	If not, see <http://www.gnu.org/licenses/>.
//

#import "BPStyle.h"
#import "BPUtilities.h"

static BOOL shouldUseFlatUserInterface;

@implementation BPStyle

+ (void)load
{
	shouldUseFlatUserInterface = [BPUtilities isRunningYosemiteOrLater];
}

+ (BOOL)isFlat
{
	return shouldUseFlatUserInterface;
}

+ (NSFont *)defaultFixedWidthFont
{
	static NSFont *font = nil;
	
	if (!font)
	{
		font = [NSFont fontWithName:@"Andale Mono" size:12];
		if (!font)
			font = [NSFont fontWithName:@"Menlo" size:12];
		if (!font)
			font = [NSFont systemFontOfSize:12];
	}
	
	return font;
}

#pragma mark Toolbar

+ (NSToolbarSizeMode)toolbarSize
{
	if (self.isFlat)
	{
		return NSToolbarSizeModeSmall;
	}
	return NSToolbarSizeModeDefault;
}

+ (NSImage *)toolbarImageForInstall
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"download" orSymbol:@"plus.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForUninstall
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"delete" orSymbol:@"xmark.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForTap
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"download" orSymbol:@"plus.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForUntap
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"delete" orSymbol:@"xmark.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForUpdate
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"reload" orSymbol:@"arrow.triangle.2.circlepath.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForMoreInformation
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"label" orSymbol:@"info.circle.fill"];
	}
	
	return image;
}

+ (NSImage *)toolbarImageForUpgrade
{
	static NSImage *image;
	if (!image) {
		image = [self appropriateIconForToolbarWithName:@"globe" orSymbol:@"globe"];
	}
	
	return image;
}

+ (NSImage *)appropriateIconForToolbarWithName:(NSString *)name orSymbol:(NSString *)symbol
{
	if (@available(macOS 11.0, *)) {
		return [NSImage imageWithSystemSymbolName:symbol accessibilityDescription:name];
	} else if ([self isFlat]) {
		return [NSImage imageNamed:[NSString stringWithFormat:@"%@_flat", name]];
	} else {
		return [NSImage imageNamed:[NSString stringWithFormat:@"%@.icns", name]];
	}
}

#pragma mark Popover

+ (NSColor *)popoverTitleColor
{
	static NSColor *color;
	if (!color) {
		if (@available(macOS 10.14, *)) {
			color = [NSColor textColor];
		} else {
			color = [self isFlat] ? [NSColor blackColor] : [NSColor whiteColor];
		}
	}
	
	return color;
}

+ (NSColor *)popoverTextViewColor
{
	static NSColor *color;
	if (!color) {
		if (@available(macOS 10.14, *)) {
			color = [NSColor textColor];
		} else {
			color = [self isFlat] ? [NSColor blackColor] : [NSColor whiteColor];
		}
	}
	
	return color;
}

#pragma mark Sidebar

+ (NSColor *)sidebarDividerColor
{
	static NSColor *color;
	if (!color) {
		color = [NSColor colorWithCalibratedRed:0.835294 green:0.858824 blue:0.858824 alpha:1.0];
	}
	
	return color;
}

@end
