//
//  main.m
//  －选择排序
//
//  Created by 赵瑞玮 on 16/11/21.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //定义数组
    int arr[]={3,5,6,8,9,7,48,88,56,2,26,111,11,1,12,24};
    //为了统计for循环效率，按照最大到最小排序，我们使用累加数列，分析得知第一个元素变为最大需要数组元素个数－1次循环，依次递减，也就是5-4-3-2-1等于15次循环操作。我们就以此为突破口；
    //标记
    int k =0;
    //数组元素个数
    int n=sizeof(arr)/sizeof(arr[0]);
    //外层循环，第一个元素一直到倒数第二个元素。
    for (int i=0; i<n-1; i++) {
        // 内层循环，外层循环的基础上，从其元素后面（＋1）开始和arr［i］比较大小;
        for(int j=i+1;j<n;j++){
            //判断标准，比较法比被比较方大
            if(arr[i]<arr[j]){
                //两者相加再相减，交换两个数据
                arr[i]=arr[i]+arr[j];
                arr[j]=arr[i]-arr[j];
                arr[i]=arr[i]-arr[j];
                //进入一次循环纪录一次，计算效率。验证之前大设想
                k++;
            }
        }
    }
    printf("从最大到最小排序，依次为\n");
    for (int i=0; i<n; i++){
        printf("%d--",arr[i]);
    }
    printf("\n");
    printf("for循环遍历次数%d",k);
    printf("\n");
    return 0;
    //10-9-1-7-4-2-1
}
