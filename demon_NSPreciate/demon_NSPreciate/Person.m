//
//  Person.m
//  demon_NSPreciate
//
//  Created by Bruce on 2017/8/16.
//  Copyright © 2017年 BruceZhu. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (NSArray<Person *> *)randomInstance
{
    
    NSArray *names = @[@"jack Ma",@"RoseA",@"Lily",@"jack Chen",@"Xiao Ming"];
    NSArray *addres = @[@"BeiJing",@"ShangHai",@"WuXi",@"ShenZhen",@"HuangShan"];
    NSArray *professional = @[@"Student",@"Doctor",@"Professor",@"IT",@"Teacher"];
    NSArray *age = @[@12,@13,@43,@31,@21];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSInteger i =0; i < names.count; i++) {
        Person *p = [[Person alloc] init];
        p.name = names[i];
        p.address = addres[i];
        p.professional = professional[i];
        p.age = [age[i] integerValue];
        [temp addObject:p];
    }
    return temp;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, address:%@,   professional:%@ ,  age:%zd  ",self.name,self.address,self.professional,self.age];
}
@end
