%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 黑白二值，子图有伪装
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','原图');
imshow(A);

[B1,N1] = imread('l3.bmp', 'bmp');
figure('name','伪装1');
imshow(B1);

[B2,N2] = imread('l4.bmp', 'bmp');
figure('name','伪装2');
imshow(B2);

bw = im2bw(A);
figure('name','二值');
imshow(bw);
imwrite(bw,'bw.bmp');%二值图

bw1 = im2bw(B1);
figure('name','二值1');
imshow(bw1);
imwrite(bw1,'w1.bmp');%伪装二值图1

bw2 = im2bw(B2);
figure('name','二值2');
imshow(bw2);
imwrite(bw2,'w2.bmp');%伪装二值图2

[ C1,C2 ] = decwithimg( bw,bw1,bw2 );% 利用自定义函数decwithimg()分解得到有伪装的子图

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