//
//  main.m
//  冒泡排序－重复数字的效率处理
//
//  Created by 赵瑞玮 on 16/11/21.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //定义数组
    int arr[]={3,4,5,6,7,8,11,9,2,1,12,16,18};
    //测试效率
    int k=0;
    //计算数组长度
    int length=sizeof(arr)/sizeof(arr[0]);
    int num =length;
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
        //效率处理*出现和已经排好的最小值相同的，直接处理。
        for (int i=0; i<length-1; i++){
            if(arr[i] == arr[length-1]){
                arr[length-2]=arr[i]^arr[length-2];
                arr[i]=arr[i]^arr[length-2];
                arr[length-2]=arr[i]^arr[length-2];
                length--;
            }
        }
    }
    printf("从最大到最小排序，依次为\n");
    for (int i=0; i<num; i++){
        printf("%d--",arr[i]);
    }
    printf("\n");
    printf("for循环遍历次数%d",k);
    printf("\n");
    return 0;
    //8+7+6+4+2
}
