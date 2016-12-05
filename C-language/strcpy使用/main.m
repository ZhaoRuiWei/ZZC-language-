//
//  main.m
//  strcpy使用
//
//  Created by 赵瑞玮 on 16/12/5.
//  Copyright © 2016年 zhaoruiwei. All rights reserved.
//
#import <Foundation/Foundation.h>
#include <string.h>
void getMemo1(char **p,int num){
    *p=(char*)malloc(num);
}
void test(void){
    char *str=NULL;
    getMemo1(&str, 100);
    strcpy(str, "hello");
    printf("%s",str);
    printf("\n");
}
char *getMemo2(void){
    char *p1="hello world";
    return p1;
}
void test_(void){
    char *str=NULL;
    str =getMemo2();
    printf("%s",str);
}
void Test(void){
    char string[11];
    char str[]="0123456789";
    strcpy(string,str);
    for (int i=0; i<10; i++) {
        printf("%c",string[i]);
        printf("\n");
    }
}
int main(int argc, const char * argv[]) {
    char str[]="http://www.xmobileapp.com/";
    char *p=str;
    int n=10;
    printf("%zd",sizeof(str));
    printf("\n");
    printf("%zd",sizeof(p));
    printf("\n");
    printf("%zd",sizeof(n));
    printf("\n");
    void*p_=malloc(100);
    printf("%zd",sizeof(p_));
    printf("\n");
    printf("------------分割线－－－－－\n");
    test();
    printf("------------分割线－－－－－\n");
    test_();
    printf("------------分割线－－－－－\n");
    Test();
    return 0;
}
