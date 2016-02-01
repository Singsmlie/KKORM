//
//  KKORMHelper.h
//  KKDBORM
//
//  Created by kevin on 16/1/31.
//  Copyright © 2016年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@class FMResultSet;

@interface KKORMHelper : NSObject

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)createStatementForClass:(Class)classRepresentation;

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)dropStatementForClass:(Class)classRepresentation;

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)selectStatementForClass:(Class)classRepresentation;

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)insertStatementForClass:(Class)classRepresentation;

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)updateStatementForClass:(Class)classRepresentation;

/*!
 * @param classRepresentation # a class implementing the FMDBORMTableProtocol
 * @return the statement
 */
+(NSString*)deleteStatementForClass:(Class)classRepresentation;

/**
 *  将单行信息转化字典数组
 *
 *  @param rs 集合
 *
 *  @return 字典数组
 */
+(NSMutableArray *)newDictionaryArrayWithResultSet:(FMResultSet*)rs;

/**
 *  根据sql 查询字典数组（一般用于连表查询)
 *
 *  @param sql sql 语句
 *  @param database 数据库对象
 *
 *  @return 字典数组
 */
+(void)newDictionaryArrayWithSQL:(NSString*)sql dataBase:(FMDatabaseQueue*)db querySuccess:(void (^)(NSMutableArray *))success;


@end
