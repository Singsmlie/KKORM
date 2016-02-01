//
//  KKORMModel.h
//  KKDBORM
//
//  Created by kevin on 16/1/31.
//  Copyright © 2016年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKORMProtocol.h"

@interface KKORMModel : NSObject<KKORMProtocol>

/*!
 * uid property for a unique row identification
 */
@property (nonatomic, strong) NSNumber *uid;

@end
