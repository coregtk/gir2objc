/*
 * main.m
 * This file is part of gir2objc
 *
 * Copyright (C) 2014 - Tyler Burton
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

/*
 * Modified by the gir2objc Team, 2014. See the AUTHORS file for a
 * list of people on the gir2objc Team.
 * See the ChangeLog files for a list of changes.
 *
 */

/*
 * Objective-C imports
 */
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSError.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>

#import "Gir2Objc/Gir2Objc.h"

/**
 * This is just a sample program showing how to interact with the library classes
 */
int main(int argc, char *argv[])
{
	/*
	 * Check error conditions
	 */
	 
	if(argc > 2)
	{
		printf("ERROR - too many arguments!\n");
		return 1;
	}
	else if(argc != 2)
	{
		printf("ERROR - need to provide the path to the GIR file as an argument\n");
		return 1;
	}

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	Gir2Objc *gir2Objc = [[Gir2Objc alloc] init];
	
	NSString *girFile = [NSString stringWithUTF8String:argv[1]];
	NSDictionary *girDict = nil;
	NSError *parseError = nil;
	
	NSLog(@"Parsing GIR file %@...", girFile);
	
	if(![gir2Objc parseGirFromFile: girFile intoDictionary: &girDict withError: &parseError])
	{
		NSLog(@"Failed to parse GIR file!");
		NSLog(@"%@", parseError);
		return 1;
	}
	
	NSLog(@"Finished parsing GIR file.");
	
	NSLog(@"Converting parsed dictionary into Objective-C object...");
	
	GIRApi *api = [gir2Objc firstApiFromDictionary: girDict];
	if(api == nil)
	{
		NSLog(@"Failed to convert dictionary!");
	}
	else
	{
		NSLog(@"Finished converting dictionary.");
	}
	
	/*
	 * Release allocated memory
	 */
	[gir2Objc release];
	[pool release];
	
	return 0;
}