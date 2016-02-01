//
//  KKORMColumn.h
//  KKDBORM
//
//  Created by kevin on 15/12/18.
//  Copyright © 2015年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

// Culumn Type Strings
extern NSString* const KKDBORMTypeNull;
extern NSString* const KKDBORMTypeInteger;
extern NSString* const KKDBORMTypeText;
extern NSString* const KKDBORMTypeReal;
extern NSString* const FMDBORMTypeBlob;

// Culumn Extra Strings
extern NSString* const KKDBORMExtraPrimaryKey;
extern NSString* const KKDBORMExtraAutoIncrement;
extern NSString* const KKDBORMExtraUnique;
extern NSString* const KKDBORMExtraNotNull;

// Extra Default NotNuLL Default And Default
#define KKDBORMExtraNotNullWithDefault(x) [NSString stringWithFormat:@"%@ DEFAULT '%@'", FMDBORMExtraNotNull, x]
#define KKDBORMExtraDefault(x) [NSString stringWithFormat:@"DEFAULT '%@'", x]
#define KKDBORMExtraIntegerDefault(x) [NSString stringWithFormat:@"DEFAULT %ld", (long)x]

@interface KKORMColumn : NSObject

@property (atomic, strong) NSString *name;
@property (atomic, strong) NSString *type;
@property (atomic, strong) NSArray *extraModifier;

/**
 *  init
 *
 *  @param columnName name
 *  @param typeName   type for example KKDBORMTypeText
 *
 *  @return
 */
-(id)initWithColumnName:(NSString*)columnName andType:(NSString*)typeName;

/**
 *  init
 *
 *  @param columnName name
 *  @param typeName   type for example KKDBORMTypeText
 *  @param extras     KKDBORMExtraDefault(x)
 *
 *  @return <#return value description#>
 */
-(id)initWithColumnName:(NSString*)columnName andType:(NSString*)typeName andExtraModifier:(NSArray*)extras;

@end
