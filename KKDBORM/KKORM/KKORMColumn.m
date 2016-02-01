//
//  KKORMColumn.m
//  KKDBORM
//
//  Created by kevin on 15/12/18.
//  Copyright © 2015年 kevin. All rights reserved.
//

#import "KKORMColumn.h"

// Type Strings
NSString* const KKDBORMTypeNull = @"NULL"; //值是NULL
NSString* const KKDBORMTypeInteger = @"INTEGER"; //值是有符号整形，根据值的大小以1,2,3,4,6或8字节存放
NSString* const KKDBORMTypeText = @"TEXT"; //值是文本字符串，使用数据库编码（UTF-8，UTF-16BE或者UTF-16LE）存放
NSString* const KKDBORMTypeReal = @"REAL"; //值是浮点型值，以8字节IEEE浮点数存放
NSString* const KKDBORMTypeBlob = @"BLOB"; //只是一个数据块，完全按照输入存放（即没有准换）

// Extra Strings
NSString* const KKDBORMExtraPrimaryKey = @"PRIMARY KEY"; //主键
NSString* const KKDBORMExtraAutoIncrement = @"AUTOINCREMENT"; //自增
NSString* const KKDBORMExtraUnique = @"UNIQUE"; //外联
NSString* const KKDBORMExtraNotNull = @"NOT NULL"; //不为空

@implementation KKORMColumn
{
    NSArray *_extras;
}

- (id)initWithColumnName:(NSString *)columnName andType:(NSString *)typeName
{
    self = [self initWithColumnName:columnName andType:typeName andExtraModifier:@[]];
    return self;
}

- (id)initWithColumnName:(NSString *)columnName andType:(NSString *)typeName andExtraModifier:(NSArray *)extras
{
    self = [super init];
    if (self) {
        self.name = columnName;
        self.type = typeName;
        self.extraModifier = extras;
    }
    return self;
}

-(NSArray *)extraModifier {
    return _extras;
}

-(void)setExtraModifier:(NSArray *)extras {
    NSMutableArray *extrasArray = [[NSMutableArray alloc] initWithCapacity:extras.count];
    for (NSString* extra in extras) {
        [extrasArray addObject:[extra uppercaseString]];
    }
    _extras = [[NSArray alloc]initWithArray:extras];
}

-(NSString *)description {
    NSMutableArray *outArray = [[NSMutableArray alloc] initWithCapacity:3];
    [outArray addObject:self.name];
    [outArray addObject:self.type];
    if (self.extraModifier.count > 0) {
        [outArray addObject:[self.extraModifier componentsJoinedByString:@" "]];
    }
    return [outArray componentsJoinedByString:@" "];
    
}


@end
