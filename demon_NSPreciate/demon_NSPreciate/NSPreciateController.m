//
//  NSPreciateController.m
//  demon_NSPreciate
//
//  Created by Bruce on 2017/8/16.
//  Copyright © 2017年 BruceZhu. All rights reserved.
//

/*
 参考博客：
 1.https://www.infragistics.com/community/blogs/stevez/archive/2013/10/21/ios-objective-c-filtering-a-nsarray-using-nspredicate.aspx
 2.https://stackoverflow.com/questions/18822777/nspredicate-on-an-nsarray-to-search-for-any-object
 3.http://nshipster.com/nspredicate/（swift）
 
 优点：避免使用多个for循环
 
 注意点：
 1.For strings, you can use any of the following filters: (NOTE: must be all caps)
 
 BEGINSWITH
 ENDSWITH
 LIKE
 MATCHES
 CONTAINS
 
 
 2.For numbers, you can use:
 
 !=
 >
 >=
 <
 <=
 ==
 
 3.OR 、AND 等关键字不区分大小写，但非关键字区分大小写
 
 4.%@ is a var arg substitution for an object value—often a string, number, or date.
   %K is a var arg substitution for a key path.
 
 5.为了减少匹配规则名称，可以在这些运算符后面添加修饰符：[c]表示不区分大小写，[d]表示不区分发音符号 ,[cd]表示两者都不区分。
 
 */
#import "NSPreciateController.h"
#import "Person.h"

@interface NSPreciateController ()
@property (nonatomic ,strong) NSArray *persons;
@end

@implementation NSPreciateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    NSArray *persons = [Person randomInstance];
    self.persons = persons ;
    
    [self prama_cd];
}
#pragma mark - 基础
-(void)prama_CONTAINS
{
    NSString* filter = @"%K CONTAINS %@";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:filter, @"self", @"a"];
    NSArray* filteredData = [[self.persons valueForKeyPath:@"name"] filteredArrayUsingPredicate:predicate];
    NSLog(@"CONTAINS_filteredData:%@",filteredData);
}

// c、d、$
- (void)prama_cd
{
    NSPredicate *predicate = [[NSPredicate predicateWithFormat:@"(self.name contains[cd] $str)"] predicateWithSubstitutionVariables:@{@"str":@"jack"}];
    // 下面语法亦可
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.name contains[cd] %@",@"jack"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// or 、 ||
- (void)prama_CONTAINS_OR
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[cd] %@ OR self.address contains[c] %@ OR self.age == 13", @"jack",@"BeiJing"];
    // 下面语法亦可
//     NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[c] %@ || self.address contains[c] %@ OR self.age == 13", @"jack",@"BeiJing"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"prama_CONTAINS_OR_filteredData:%@",filteredData);
}

// and 、&&
- (void)prama_CONTAINS_AND
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[cd] %@ and self.age > 11", @"jack"];
    // 下面语法亦可
//    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[c] %@ && self.age > 11", @"jack"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// !=、<>; =、==; >=, =>;
- (void)prama_CONTAINS_NOT
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[cd] %@ and self.age != 12", @"jack"];
    // 下面语法亦可
//    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[c] %@ and self.age <> 12", @"jack"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// between
- (void)prama_CONTAINS_between
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[cd] %@ and self.age BETWEEN {11,90}", @"jack"];
    // 下面语法亦可
//    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name contains[c] %@ and self.age >11 and self.age <90", @"jack"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// BEGINSWITH ,以某字母开头
- (void)prama_CONTAINS_BEGINSWITH
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.name BEGINSWITH[cd] %@", @"R"];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// ENDSWITH ,以某字母结尾
- (void)prama_CONTAINS_ENDSWITH
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.professional ENDSWITH[cd] %@", @"r" ];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// LIKE ,通配符，？代替一个字符、*代替0~多个字符
- (void)prama_CONTAINS_LIKE
{
     // 打开注释检查更多
//    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.professional like[cd] %@", @"Docto?" ];
//    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.professional like[cd] %@", @"D*" ];
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self.professional like[cd] %@", @"*r" ];
    NSArray* filteredData = [self.persons filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredData:%@",filteredData);
}

// 符合某个规则
- (void)prama_MATCHES
{
    // 正则 输入内容必须是数字和字母组合
    NSString* number=@"(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,14})$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"self MATCHES %@",number];
    BOOL result  = [numberPre evaluateWithObject:@"13811111111d"];
    NSLog(@"result:%zd",result);
}

#pragma mark - 扩展

@end
