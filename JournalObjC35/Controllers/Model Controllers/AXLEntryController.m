  //
  //  AXLEntryController.m
  //  JournalObjC35
  //
  //  Created by Alex Lundquist on 8/10/20.
  //  Copyright © 2020 Alex Lundquist. All rights reserved.
  //

#import "AXLEntryController.h"
#import "AXLEntry.h"

@implementation AXLEntryController

+ (AXLEntryController *)sharedInstance
{
  static AXLEntryController * sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [AXLEntryController new];
  });
  return sharedInstance;
}

- (instancetype)init
{
  self = [super init];
  if (self)
    {
    _entries = [NSMutableArray new];
    }
  return self;
}

- (void)addEntry:(AXLEntry *)entry
{
  [self.entries addObject:entry];
}

- (void)removeEntry:(AXLEntry *)entry
{
  [self.entries removeObject:entry];
}

- (void)udpateEntry:(AXLEntry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText
{
  entry.title = title;
  entry.bodyText = bodyText;
}
@end
