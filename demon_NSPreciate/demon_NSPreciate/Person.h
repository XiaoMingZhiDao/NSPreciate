//
//  Person.h
//  demon_NSPreciate
//
//  Created by Bruce on 2017/8/16.
//  Copyright © 2017年 BruceZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic ,copy) NSString *name;

@property (nonatomic ,copy) NSString *address;

@property (nonatomic ,copy) NSString *professional;

@property (nonatomic ,assign) NSInteger age ;

+ (NSArray<Person *> *)randomInstance;
@end
