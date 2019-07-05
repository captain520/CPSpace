//
//  CPSortVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/7/5.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSortVC.h"

typedef int  KeyType;

#define MAX_SIZE 20

typedef struct {
    KeyType key;
} RecordType;

typedef struct {
    RecordType r[MAX_SIZE];
    int length;
}SqList;

@interface CPSortVC () {
    SqList *l;
}

@end

@implementation CPSortVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int temp[] = {49,38,65,49,76,13,27,52};
    int count = sizeof(temp)/sizeof(int);
    
    for (int i = 0; i < count; ++i) {
        NSLog(@" %@ ",@(temp[i]));
    }
    

    l = (SqList *)malloc(sizeof(SqList));
    l->length = count;

    for (int i = 0; i < count; ++i) {
        RecordType t;
        t.key = temp[i];
        
        l->r[i] = t;
    }
    
}
- (IBAction)printAllData:(id)sender {
    

    for (NSInteger i = 0; i < l->length; ++i) {
        printf(" %d ",l->r[i].key);
    }
    
    printf("\n");
}

- (IBAction)selectSortAction:(id)sender {
    
    RecordType temp;
    
    for (int i = 0; i < l->length; ++i) {           // O(n)
        for (int j = i + 1; j < l->length; ++j) {   // O(n(n - 1)/2)    -----> O(n^2)
            if (l->r[j].key < l->r[i].key) {
//            if (l->r[j].key > l->r[i].key) {
                temp = l->r[j];
                l->r[j] = l->r[i];
                l->r[i] = temp;
            }
        }
        
        [self printAllData:nil];
    }
}

- (IBAction)bubbleSort:(id)sender {
    
    RecordType temp;
    
    for (int i = 0; i < l->length; ++i) {           // O(n)
        for (int j = 0; j < l->length - i; ++j) {   // O(3n(n - 1)/2)    -----> O(n^2)
            
            if (l->r[j].key > l->r[j+1].key) {
                temp = l->r[j];
                l->r[j] = l->r[j+1];
                l->r[j+1] = temp;
            }
        }
        
        [self printAllData:nil];
    }
}

- (IBAction)insertSort:(id)sender {
    
    RecordType temp;
    
    for (int i = 1; i < l->length; ++i) {
        for (int j = i; j > 0 && l->r[j].key < l->r[j - 1].key; j--) {
            temp = l->r[j - 1];
            l->r[j - 1] = l->r[j];
            l->r[j] = temp;
        }

        [self printAllData:nil];
    }

}

//快速排序
void quick_sort(int s[], int l, int r)
{
    if (l < r)
    {
        //Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
        int i = l, j = r, x = s[l];
        while (i < j)
        {
            while(i < j && s[j] >= x) // 从右向左找第一个小于x的数
                j--;
            if(i < j)
                s[i++] = s[j];
            while(i < j && s[i] < x) // 从左向右找第一个大于等于x的数
                i++;
            if(i < j)
                s[j--] = s[i];
        }
        s[i] = x;
        quick_sort(s, l, i - 1); // 递归调用
        quick_sort(s, i + 1, r);
    }
}



- (IBAction)quickSort:(id)sender {
    int temp[] = {49,38,65,49,76,13,27,52};
    
    quick_sort(temp, 0, 7);

    for (NSInteger i = 0; i < 8; ++i) {
        printf(" %d ",temp[i]);
    }
    
    printf("\n");
}

void swap2Int(int *a, int *b) {
    *a = (*a) ^ (*b);
    *b = (*a) ^ (*b);
    *a = (*a) ^ (*b);
}

@end
