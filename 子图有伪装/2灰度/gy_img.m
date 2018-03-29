%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 灰度，子图有伪装
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','原图1')
imshow(A)

[B1,N1] = imread('l3.bmp', 'bmp');
figure('name','伪装1')
imshow(B1)

[B2,N2] = imread('l4.bmp', 'bmp');
figure('name','伪装2')
imshow(B2)

gray = rgb2gray(A);
gray=double(gray)/255;%把矩阵由UNIT8转换为实型  
gray1 = rgb2gray(B1);
gray1=double(gray1)/255;%把矩阵由UNIT8转换为实型  
gray2 = rgb2gray(B2);
gray2=double(gray2)/255;%把矩阵由UNIT8转换为实型  

bsd = im2hf(gray);
figure('name','原图半色调');
imshow(bsd);
imwrite(bsd,'bsd.bmp');%原图半色调

bsd1 = im2hf(gray1);
figure('name','伪装半色调1');
imshow(bsd1);
imwrite(bsd1,'w1.bmp');%伪装半色调1

bsd2 = im2hf(gray2);
figure('name','伪装半色调2');
imshow(bsd2);
imwrite(bsd2,'w2.bmp');%伪装半色调1

[ C1,C2 ] = decwithimg( bsd,bsd1,bsd2 );% 利用自定义函数decwithimg()分解得到有伪装的子图

figure('name','z1');
imshow(C1);
imwrite(C1,'z1.bmp');% 带伪装子图一

figure('name','z2');
imshow(C2);
imwrite(C2,'z2.bmp');% 带伪装子图二

D = C1.*C2;% 两张图像叠加还原，应该用乘法。

figure('name','y');
imshow(D);
imwrite(D,'y.bmp');% 恢复图片