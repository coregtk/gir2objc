/*
 * GIREnumeration.h
 * This file is part of gir2objc
 *
 * Copyright (C) 2016 - Tyler Burton
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
 * Modified by the gir2objc Team, 2016. See the AUTHORS file for a
 * list of people on the gir2objc Team.
 * See the ChangeLog files for a list of changes.
 *
 */

/*
 * Objective-C imports
 */
#import "GIR/GIRBase.h"
#import "GIR/GIRDoc.h"
#import "GIR/GIRFunction.h"
#import "GIR/GIRMember.h"

@interface GIREnumeration : GIRBase
{
	NSString *cType;
	NSString *name;
	NSString *version;
	NSString *deprecatedVersion;
	BOOL deprecated;
	GIRDoc *doc;
	GIRDoc *docDeprecated;
	NSMutableArray *members;
	NSMutableArray *functions;
}

@property (nonatomic, retain) NSString *cType;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *deprecatedVersion;
@property (nonatomic) BOOL deprecated;
@property (nonatomic, retain) GIRDoc *doc;
@property (nonatomic, retain) GIRDoc *docDeprecated;
@property (nonatomic, retain) NSMutableArray *members;
@property (nonatomic, retain) NSMutableArray *functions;

@end
