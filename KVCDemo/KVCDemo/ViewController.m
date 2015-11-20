//
//  ViewController.m
//  KVCDemo
//
//  Created by litt1e-p on 15/11/20.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import "LPProduct.h"
#import <objc/runtime.h>
#import "NSArray+LPOperator.h"
#import "LPFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /** example1 */
    LPProduct *product1 = [LPProduct new];
    product1.price = 1.0;
    
    LPProduct *product2 = [LPProduct new];
    product2.price = 2.0;
    
    LPProduct *product3 = [LPProduct new];
    product3.price = 3.0;
    
    /** kvc base */
    NSLog(@"kvc base=======================");
    NSLog(@"price 1: %@", [product1 valueForKeyPath:@"price"]);
    [product1 setValue:@100 forKeyPath:@"price"];
    NSLog(@"price 1 change: %@", [product1 valueForKeyPath:@"price"]);
    product1.factory = [LPFactory new];
    [product1 setValue:@"make in japan" forKeyPath:@"factory.name"];
    NSLog(@"price 1 factory name: %@", [product1 valueForKeyPath:@"factory.name"]);

    
    NSArray *products = @[product1, product2, product3];
    NSLog(@"example1=======================");
    //keyPath with "@"
    NSLog(@"avg : %@", [products valueForKeyPath:@"@avg.price"]);
    NSLog(@"count : %@", [products valueForKeyPath:@"@count.price"]);
    NSLog(@"max : %@", [products valueForKeyPath:@"@max.price"]);
    NSLog(@"min : %@", [products valueForKeyPath:@"@min.price"]);
    NSLog(@"sum : %@", [products valueForKeyPath:@"@sum.price"]);
 
    /** example2 */
    NSLog(@"example2=======================");
    NSArray *arr = @[@1, @2, @3, @4, @5];
    NSLog(@"avg : %@", [arr valueForKeyPath:@"@avg.self"]);
    NSLog(@"count : %@", [arr valueForKeyPath:@"@count.self"]);
    NSLog(@"max : %@", [arr valueForKeyPath:@"@max.self"]);
    NSLog(@"min : %@", [arr valueForKeyPath:@"@min.self"]);
    NSLog(@"sum : %@", [arr valueForKeyPath:@"@sum.self"]);
    
    /** example3 */
    NSLog(@"example3=======================");
    LPProduct *product4 = [LPProduct new];
    product4.name = @"Apple Watch";
    
    LPProduct *product5 = [LPProduct new];
    product5.name = @"Apple Watch";
    
    LPProduct *product6 = [LPProduct new];
    product6.name = @"Apple Watch";
    
    LPProduct *product7 = [LPProduct new];
    product7.name = @"iPad Pro";
    
    LPProduct *product8 = [LPProduct new];
    product8.name = @"iPad Pro";
    
    LPProduct *product9 = [LPProduct new];
    product9.name = @"iPhone 6s";
    
    NSArray *products2 = @[product4, product5, product6, product7, product8, product9];
    NSLog(@"unionOfObjects %@", [products2 valueForKeyPath:@"@unionOfObjects.name"]);
    NSLog(@"unionOfObjects %@", [products2 valueForKeyPath:@"@unionOfObjects.name"]);
    NSLog(@"distinctUnionOfObjects %@", [products2 valueForKeyPath:@"@distinctUnionOfObjects.name"]);
    
    /** example4 */
    NSLog(@"example4=======================");
    NSSet *pSet1 = [NSSet setWithObjects:product4, product7, nil];
    NSSet *pSet2 = [NSSet setWithObjects:product5, product8, nil];
    NSSet *pSet3 = [NSSet setWithObjects:product6, product9, nil];
    NSSet *set = [NSSet setWithObjects:pSet1, pSet2, pSet3, nil];
    
    NSArray *pArr1 = @[product4, product7];
    NSArray *pArr2 = @[product5, product8];
    NSArray *pArr3 = @[product6, product9];
    NSArray *array = @[pArr1, pArr2, pArr3];
    NSLog(@"unionOfArrays: %@", [array valueForKeyPath:@"@unionOfArrays.name"]);
    NSLog(@"distinctUnionOfArrays: %@", [array valueForKeyPath:@"@distinctUnionOfArrays.name"]);
    NSLog(@"distinctUnionOfSets: %@", [set valueForKeyPath:@"@distinctUnionOfSets.name"]);
    
    /** custom KVC */
    NSLog(@"custom KVC=====================");
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList([NSArray class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        SEL methodSel = method_getName(method);
        NSLog(@"%d----%@", i, NSStringFromSelector(methodSel));
    }
    
    NSLog(@"%@", [arr valueForKeyPath:@"@LP.self"]);
}

@end
