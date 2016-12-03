//
//  main.m
//  冒泡排序－重复数字的效率处理
//
//  Created by 赵瑞玮 on 16/11/21.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
//关于冒泡排序的效率问题处理，剔除重复数字的干扰，效率值有提高，但是仍然没有选择排序效率高
//原理分析，当遇到之前参与过比较的数字，隔绝，寻找下一个目标。独立计算逻辑。其他情况，正常比较临近元素
int main(int argc, const char * argv[]) {
    //定义数组
    int arr[]={3,5,6,5,4,5,3,4,8,12,10,6,3,7,8,8,324,2,34,2534,5,3,6,45,65,76657,8,76,8,78,79,789,7,89,3,453,53,45,3,45,6,45,654,6,7,7,7,6,57,6,57,7,56,7,8,6786,78};
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
            //效率值处理，如果比较的后者之前数字已经存在，k＋＋，比较后面＋1的数字
            for (int m=0; m<j+1; m++) {
                if(arr[m]==arr[j+1]&& arr[m]!=arr[j+2]){
                    if(arr[j]<arr[j+2]&& j+2<length){
                        //交换两者的值，亦或运算
                        arr[j]=arr[j]^arr[j+2];
                        arr[j+2]=arr[j]^arr[j+2];
                        arr[j]=arr[j]^arr[j+2];
                        k++;
                        j++;
                    }
                }
            }
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
    for (int i=0; i<num; i++){
        printf("%d--",arr[i]);
    }
    printf("\n");
    printf("for循环遍历次数%d",k);
    printf("\n");
    return 0;
    //8+7+6+4+2
}
