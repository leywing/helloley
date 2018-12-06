1.mo.m

该函数是用来算向量模长的，要求输入的为【1,3，5，6】这样的行向量的地址
其会返回向量的模长

2.ley_fenjie.m

[left,right]=ley_fenjie(a,r,c,i)
%会按要求将函数分解成left和right两个矩阵，并返回
%输入的参数
%a:矩阵
%r:矩阵行数
%c:举证列数
%i:字符串   ‘lu’'qr' 'ho' 'gi'
%        'lu'代表 lu分解，只能分解方阵，如果不是方阵，会返回“不能解决非方阵”（英文）
	这里的lu分解是直接高斯约减的，没有用到部分主元法，所以遇到主元是0会失败
%      ‘qr’代表QR分解,可以分解rectangular
%       ‘ho’代表household redution   可以分解rectangular
%         'gi’  代表givens redution  可以分解rectangular

%在输入参数后,函数会根据要求进行运算，并展示结果，例如LU的如下
            disp('LU ');
            disp('L=');
            disp(left);
            disp('U=');
            disp(right);
%并且会返回left,right

3.test_function_m
%这是我自己写的来测试下到底能不能成功分解的
%可以直接运行