//
//  main.m
//  数字拆解
//
//  Created by 赵瑞玮 on 16/11/21.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 题目是这样的：
 3 = 2+1 = 1+1+1 所以3有三种拆法
 4 = 3 + 1 = 2 + 2 = 2 + 1 + 1 = 1 + 1 + 1 + 1 共五种
 5 = 4 + 1 = 3 + 2 = 3 + 1 + 1 = 2 + 2 + 1 = 2 + 1 + 1 + 1 = 1 + 1 +1 +1 +1 共七种
 依此类推，请问一个指定数字NUM的拆解方法个数有多少个？
 */
#include <stdio.h>
#include <stdlib.h>
//  要拆解的数字
#define NUM 7
#define DBUG 0
int main(int argc, const char * argv[]) {
    int table[NUM][NUM/2+1] = {0}; // 动态规画表格
    int count = 0;
    int result = 0;
    int i, j, k;
    printf("数字拆解\n");
    printf("3 = 2+1 = 1+1+1 所以3有三种拆法\n");
    printf("4 = 3 + 1 = 2 + 2 = 2 + 1 + 1 = 1 + 1 + 1 + 1");
    printf("共五种\n");
    printf("5 = 4 + 1 = 3 + 2 = 3 + 1 + 1");
    printf(" = 2 + 2 + 1 = 2 + 1 + 1 + 1 = 1 + 1 +1 +1 +1");
    printf("共七种\n");
    printf("依此类推，求 %d 有几种拆法？", NUM);
    // 初始化
    for(i = 0; i < NUM; i++){
        table[i][0] = 1;// 任何数以0以下的数拆解必只有1种
        table[i][1] = 1;// 任何数以1以下的数拆解必只有1种
    }
    // 动态规划
    for(i = 2; i <= NUM; i++){
        for(j = 2; j <= i; j++){
            if(i + j > NUM) // 大于 NUM
                continue;
            count = 0;
            for(k = 1 ; k <= j; k++){
                count += table[i-k][(i-k >= k) ? k : i-k];
            }
            table[i][j] = count;
        }
    }
    // 计算并显示结果
    for(k = 1 ; k <= NUM; k++){
        result += table[NUM-k][(NUM-k >= k) ? k : NUM-k];
    }
    printf("\n\nresult: %d\n", result);
    if(DBUG){
        printf("\n除错资讯\n");
        for(i = 0; i < NUM; i++) {
            for(j = 0; j < NUM/2+1; j++)
                printf("%2d", table[i][j]);
            printf("\n");
        }
    }
    return 0;
}
