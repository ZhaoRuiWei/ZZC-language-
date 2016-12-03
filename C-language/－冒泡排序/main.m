//
//  main.m
//  －冒泡排序
//
//  Created by 赵瑞玮 on 16/11/21.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 数组解析－最大到最小
 冒泡－和相邻的下一个元素比较，小的排后面
 {3,4,5,6,7,8};
 第一次4，5，6，7，8，3 比较次数5 下标0-1，1－2，2-3，3-4，4-5
 第二次5，6，7，8，4，3 比较次数4 下标0-1，1－2，2-3，3-4
 ...
 */

int main(int argc, const char * argv[]) {
    //定义数组
    int arr[]={3,5,6,5,4,5,3,4,8,12,10,6,3,7,8};
    //测试效率
    int k=0;
    //计算数组长度
    int length=sizeof(arr)/sizeof(arr[0]);
    //外层循环一次得出一个最值，因此需要length－1次排序
    for (int i=0; i<length-1; i++) {
        //内存循环，i决定比较个数，依次为5-4-3-2-1.
        //5=6-0-1
        for (int j=0; j<length-i-1; j++) {
            //核心比较。j和j+1比较
            if(arr[j]<arr[j+1])
            {
                    //交换两者的值，亦或运算
                    arr[j]=arr[j]^arr[j+1];
                    arr[j+1]=arr[j]^arr[j+1];
                    arr[j]=arr[j]^arr[j+1];
                    //循环次数测试，每次满足条件计数器加一
                    k++;
            }
        }
    }
    printf("从最大到最小排序，依次为\n");
    for (int i=0; i<length; i++){
        printf("%d--",arr[i]);
    }
    printf("\n");
    printf("for循环遍历次数%d",k);
    printf("\n");
    return 0;
}
