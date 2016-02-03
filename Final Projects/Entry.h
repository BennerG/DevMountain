//
//  Entry.h
//  Day-X
//
//  Created by Benjamin Thomas Gurrola on 10/13/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const TitleKey = @"title";
static NSString * const BodyTextKey = @"bodyText";
static NSString * const TimeStampKey = @"timestamp";

@interface Entry : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *bodyText;
@property (strong, nonatomic) NSDate *timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
