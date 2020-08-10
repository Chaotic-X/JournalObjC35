//
//  AXLEntry.h
//  JournalObjC35
//
//  Created by Alex Lundquist on 8/10/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXLEntry : NSObject

@property (nonatomic) NSDate * timeStamp;
@property (nonatomic) NSString * title;
@property (nonatomic) NSString * bodyText;


- (instancetype) initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END

