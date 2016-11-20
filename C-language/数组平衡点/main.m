//
//  main.m
//  数组平衡点
//
//  Created by 赵瑞玮 on 16/11/20.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 ／/数组平衡点
 定义一个数组，如果某个下标左右两边元素之和相等，那这个下标对应的元素就是一个平衡点
 举例arr[]={8,-5,-6,3,0}
 arr[2]和arr[4]都是数组arr[]的平衡点,另外我们会想到另一个问题，数组末尾一直添加0，符合要求的下标就会一直累加。现在，我们来实现一个方法，求出一个数组的平衡点－及相应的下标！
 */

/**
 主题方法，动态的时数组p内存储的数据是符合原始数组平衡点的下标

 @param arr   传入的需要求出平衡点的原始数组int类型
 @param N     传入的数组arr元素个数
 @param p     需要传出的平衡点下标汇总数组
 @param count 需要传出的平衡点下标汇总数组的元素个数，为以后数组便利拿到平衡点做准备。同时可以剔除指针地址传值数据改变，但数据个数不能通过常规大小计算的难题。
 */
void findBalance_ (int arr[],int N,int p[],int *count)
{
    int sum = 0;//计算传入数组和
    int balance = 0;//动态计算某一阶段数组的和
    int a =0;//统计穿出数组的下标开始点。用于给传出数组p增加数据（平衡点下标）
    for (int i=0;i<N;i++) {
        sum +=arr[i];
    }
    for (int i=0;i<N;i++){
        balance +=arr[i];
        // 计算方法，核心代码。阶段和＊2＋后一个元素=sum，也就是平衡点点标准
        if(sum == balance *2 +arr[i+1]){
            p[a]=i+1;//数组p新增数据
            a++;//数组p下标累加
            *count = a;//统计改变后的数组p（存值）的元素个数
        }
    }
}
int main(int argc, const char * argv[]) {
    //方法1 数组为参数
    int brr[] = {8,-5,-6,3,0,0,0,0};
    // 原始的平衡点下标数组，因为数组下标从0开始，我们取－1就可以剔除数组无平衡点的问题
    int m[] ={-1};
    // 满足条件下标个数
    int count =0;
    // 因为c语言数组为指针传递，需要返回一个改变的数组，本质是一个地址，内存储的数据发生了改变，地址没有改变
    printf("%p\n",m);
    findBalance_(brr,sizeof(brr)/sizeof(brr[0]),m,&count);
    for (int i=0;i<count;i++){
        if(m[0]==-1){
            printf("无符合要求");
        }else{
            printf("数组brr的平衡点%d\n",m[i]);
        }
    }
    printf("%p\n",m);
    return 0;
}
//我们也可以使用有返回值的方法，return改变后的数组，逻辑相同，但是返回值代码想对没有无返回值的代码简介。故不再赘述。
