//
//  LPProduct.h
//  KVCDemo
//
//  Created by litt1e-p on 15/11/20.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LPFactory.h"

@interface LPProduct : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) LPFactory *factory;

@end
