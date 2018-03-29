%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 灰度，子图无意义
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;  
  
im=imread('l1.bmp');  
A=rgb2gray(im);  
B=double(A)/255;%把矩阵由UNIT8转换为实型  
  
I = im2hf(B); %调用自定义函数im2hf()转化为半色调图像
  
figure('name','半色调');
imshow(I);
imwrite(I,'hf.bmp');% 半色调图片

[C1,C2] = decompose(I);% 调用自定义函数decompose()分解得到子图

figure('name','C1');
imshow(C1);
imwrite(C1,'z1.bmp');% 子图一

figure('name','C2');
imshow(C2);
imwrite(C2,'z2.bmp');% 子图二

D = C1.*C2;% 两张图像叠加还原，应该用乘法。

figure('name','D');
imshow(D);
imwrite(D,'y.bmp');% 恢复图片