//
//  ViewController.m
//  KKDBORM
//
//  Created by kevin on 15/12/18.
//  Copyright © 2015年 kevin. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
#import "KKPersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    FMDatabase *db = [FMDatabase databaseWithPath:[NSHomeDirectory() stringByAppendingString:@"/Doduments/1.db"]];
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[NSHomeDirectory() stringByAppendingString:@"/Library/1.db"]];
    
    [queue inDatabase:^(FMDatabase *db) {
        [KKPersonModel createTable:db];
    }];
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%@", date);

    for (NSInteger i = 0; i<100000; i++) {
        KKPersonModel *person = [[KKPersonModel alloc]init];
        person.name = [NSString stringWithFormat:@"name_%ld", (long)i];
        
        [queue inDatabase:^(FMDatabase *db) {
            [person put:db];
        }];
    }
    
    date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%@", date);
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
