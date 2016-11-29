//
//  main.m
//  5+5数组近似截取
//
//  Created by 赵瑞玮 on 16/11/29.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#include<math.h>
int main(int argc, const char * argv[]) {
    int arr[] = {3,4,5,6,8};
    int brr[] = {0,1,2,9,1111111};
    //求数组元素个数。
    int length= sizeof(arr)/sizeof(arr[0]);
    int sum = 0;
    // 测试满足条件的数组有多少组
    int num = 0;
    //新生数组
    int new[10]={0};
    for (int i=0; i<length*2; i++){
        //三元表达式，求出新的数组
        new[i]=(i<length)?arr[i]:brr[i-length];
        //求和sum
        sum+=new[i];
    }
    printf("新数组［new］的和为%d",sum);
    printf("\n");
    printf("符合要求的数组下标如下\n");
    int i,k,j,l,n,sum_t;
    //定义一个大点min值，后续取差值的绝对值使用
    int min=INT32_MAX;
    for(i=0;i<length*2;i++)
    {
        for(j=i+1;j<length*2;j++)
        {
            for(k=j+1;k<length*2;k++)
            {
                for(l=k+1;l<length*2;l++)
                {
                    for(n=l+1;n<length*2;n++)
                    {
                        sum_t = new[i]+new[j]+new[k]+new[l]+new[n];
                        int x;
                        x=abs(sum_t-(sum-sum_t));
                        if(x<min){
                            //取出差值的最小绝对值
                            min=x;
                        }
                    }
                    for(int m=l+1;m<length*2;m++){
                        sum_t = new[i]+new[j]+new[k]+new[l]+new[m];
                        int x;
                        x=abs(sum_t-(sum-sum_t));
                        if(x==min){
                            printf("new拆分后的数组元素下标为[%d]+[%d]+[%d]+[%d]+[%d]\n",i,j,k,l,m);
                            num++;
                        }
                    }
                }
            }
        }
    }
    printf("符合要求的拆分数组一共有%d种",num/2);
    return 0;
}
