%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 黑白二值，子图无意义
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','原图');
imshow(A);

bwimg = im2bw(A);
figure('name','二值');
imshow(bwimg);
imwrite(bwimg,'bw.bmp');%二值图

[ C1,C2 ] = decompose( bwimg );% 调用自定义函数decompose()分解得到子图

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
