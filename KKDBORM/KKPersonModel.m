//
//  KKPersonModel.m
//  KKDBORM
//
//  Created by kevin on 16/1/31.
//  Copyright © 2016年 kevin. All rights reserved.
//

#import "KKPersonModel.h"

@implementation KKPersonModel

/**
 *  必须重写 可以自定义
 *
 *  @return <#return value description#>
 */
+ (NSString *)tableName
{
    //自定义
    //return (NSString *)PersonTableName;
    return NSStringFromClass(self);
}

/**
 *  必须重写
 *
 *  @return 是否是抽象类
 */
+ (BOOL)isAbstract
{
    return NO;
}

/**
 *  字段名称 key需要与属性名称对应
 *  默认uid 主键 自增
 *  自增例子  参考 [super mapping]
 *
 *  @return 字段名称列表Dic
 */
+ (NSDictionary *)mapping
{
    NSMutableDictionary *mapping = [NSMutableDictionary dictionaryWithDictionary:[super mapping]];
    [mapping setObject:[[KKORMColumn  alloc]initWithColumnName:@"name" andType:KKDBORMTypeText] forKey:@"name"];
    return mapping;
}


@end
