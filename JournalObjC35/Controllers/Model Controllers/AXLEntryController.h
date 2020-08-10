//
//  AXLEntryController.h
//  JournalObjC35
//
//  Created by Alex Lundquist on 8/10/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXLEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXLEntryController : NSObject

+ (AXLEntryController *)sharedInstance;

@property (nonatomic) NSMutableArray<AXLEntry * > * entries;

- (void)addEntry:(AXLEntry *)entry;
- (void)removeEntry:(AXLEntry *)entry;
- (void)udpateEntry:(AXLEntry *)entry
          withTitle:(NSString *)title
           bodyText:(NSString *)bodyText;
@end

NS_ASSUME_NONNULL_END
