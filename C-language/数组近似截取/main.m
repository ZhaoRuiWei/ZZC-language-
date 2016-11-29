//
//  main.m
//  数组近似截取
//
//  Created by 赵瑞玮 on 16/11/29.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//
//原型是两个同类型数组，值任意，个数相同。希望调换数组元素，使这2个数组元素的和最为接近。
// int arr[]={3,4,5};
// int arr[]={0,1,2};
//分析先求出所列2个原始数组的和sum，然后把这些元素存储在一个数组new中，然后便利新的数组，取出任意一半元素的和sum（t）,取出sum（t）和sum－sum（t）的绝对值，求出最小值之后，判断符合要求的new数组下标
//本文档使用简单的3+3的数据测试，验证有效。需要注意的是，在取出一半数据的时候需要多重循环，此问题尚且没有更为简单的方法，另外测试新数组的元素个数需要录入真实数字。期待哪位仁兄这方面的改进。后续会重写一个5+5的数组进行验证
#import <Foundation/Foundation.h>
#include<math.h>
int main(int argc, const char * argv[]) {
    int arr[] = {3,4,5};
    int brr[] = {0,1,2};
    //求数组元素个数。
    int length= sizeof(arr)/sizeof(arr[0]);
    int sum = 0;
    int num=0;
    int new[6]={0};
    for (int i=0; i<length*2; i++){
        //三元表达式，求出新的数组
        new[i]=(i<length)?arr[i]:brr[i-length];
        //求和sum
        sum+=new[i];
    }
    printf("新数组［new］的和为%d",sum);
    printf("\n");
    printf("符合要求的数组下标如下\n");
    int i,k,j,sum_t;
    //定义一个大点min值，后续取差值的绝对值使用
    int min=100000;
    for(i=0;i<6;i++)
    {
        for(j=i+1;j<6;j++)
        {
            for(k=j+1;k<6;k++)
            {
                sum_t = new[i]+new[j]+new[k];
//                printf("new[%d]+new[%d]+new[%d]=%d\n",i,j,k,sum_t);//各种组合的列出
                int x;
                x=abs(sum_t-(sum-sum_t));
                if(x<min){
                    //取出差值的最小绝对值
                    min=x;
                }
//                //值最小的符合要求代码此处书写存在问题，因为最每次都在变化，需要重新写一次循环体
//                if(x==1){
//                    printf("new拆分后的数组元素下标为[%d]+[%d]+[%d]\n",i,j,k);
//                }
            }
            for(int m=j+1;m<6;m++){
                sum_t = new[i]+new[j]+new[m];
                int x;
                x=abs(sum_t-(sum-sum_t));
                if(x==min){
                    printf("new拆分后的数组元素下标为[%d]+[%d]+[%d]\n",i,j,m);
                    num++;
                }
            }
        }
    }
    printf("符合要求的拆分数组一共有%d种",num/2);
    return 0;
}
