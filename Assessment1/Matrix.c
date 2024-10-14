// Two Matrix Multiplication

#include <stdio.h>

int main() {
    // for matrix 1:
    int row1;int col1;
    printf("Row size of matrix1:");
    scanf("%d",&row1);
    printf("column size of matrix1::");
    scanf("%d",&col1);

        int matrix1[row1][col1];
        int row_len1 = sizeof(matrix1)/sizeof(matrix1[0]);
        int col_len1 = sizeof(matrix1[0])/sizeof(matrix1[0][0]);
  
        for(int i = 0;i<row_len1;i++){
            for(int j = 0 ; j<col_len1;j++){
                printf("Enter element of %d row %d col: ",i+1,j+1);
                scanf("%d",&matrix1[i][j]);
            }
        }
        printf("Matrix 1:\n");
        for(int i = 0;i<row_len1;i++){
            for(int j = 0 ; j<col_len1;j++){
                printf("%d ",matrix1[i][j]);
            }
            printf("\n");
        }
    // for matrix 2:
    int row2;int col2;
    printf("Row size of matrix2:");
    scanf("%d",&row2);
    printf("column size of matrix2:");
    scanf("%d",&col2);
    
        int matrix2[row2][col2];
        int row_len2 = sizeof(matrix2)/sizeof(matrix2[0]);
        int col_len2 = sizeof(matrix2[0])/sizeof(matrix2[0][0]);

        for(int i = 0;i<row_len2;i++){
            for(int j = 0 ; j<col_len2;j++){
                    printf("Enter element of %d row %d col: ",i+1,j+1);
                    scanf("%d",&matrix2[i][j]);
            }
        }
        printf("Matrix 2:\n");
        for(int i = 0;i<row_len2;i++){
            for(int j = 0 ; j<col_len2;j++){
                printf("%d ",matrix2[i][j]);
            }
            printf("\n");
        }

    // for multiplication matrix:
    if(col_len1 == row_len2){
        int result_matrix[row_len1][col_len2];
        
            for(int i = 0;i<row_len1;i++){
                for(int j = 0;j<col_len2;j++){
                    for(int k = 0;k<col_len1;k++){
                        result_matrix[i][j] = 0;
                        result_matrix[i][j] += matrix1[i][k]*matrix2[k][j];
                    }
                } 
            }
            printf("Multiplication Matrix:\n");
            for(int i = 0;i<row_len1;i++){
                for(int j = 0;j<col_len2;j++){
                    printf("%d ",result_matrix[i][j]);
                } 
                printf("\n");
            }
    }
    else{
        printf("enter valid size of matrix column size of matrix1 must be same with row size of matrix 2");
    }
}