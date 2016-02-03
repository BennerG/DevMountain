//
//  Entry.m
//  Day-X
//
//  Created by Benjamin Thomas Gurrola on 10/13/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import "Entry.h"

@implementation Entry

#pragma mark - Builder Methods

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[TitleKey];
        self.bodyText = dictionary[BodyTextKey];
        self.timestamp = dictionary[TimeStampKey];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSDictionary *dictionary = @{
                                 TitleKey:self.title,
                                 BodyTextKey:self.bodyText,
                                 TimeStampKey:self.timestamp
                                 };
    return dictionary;
}

@end
