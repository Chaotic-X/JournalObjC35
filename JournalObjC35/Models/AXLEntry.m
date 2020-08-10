//
//  AXLEntry.m
//  JournalObjC35
//
//  Created by Alex Lundquist on 8/10/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

#import "AXLEntry.h"

@implementation AXLEntry

- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
  self = [super init];
  if (self)
    {
    _title = title;
    _bodyText = bodyText;
    _timeStamp = [NSDate new];
    }
  return self;
}

@end
