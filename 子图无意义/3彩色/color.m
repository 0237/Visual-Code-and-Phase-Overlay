%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 彩色，子图无意义
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','原图');
imshow(A);

% 拆分成三张灰度图
for i = 1:256
    for j = 1:256
        for k = 1:3
            if k==1
                B1(i,j)=A(i,j,k);
            end
            if k==2
                B2(i,j)=A(i,j,k);
            end
            if k==3
                B3(i,j)=A(i,j,k);
            end
        end
    end
end

B1=double(B1)/255;%把矩阵由UNIT8转换为实型  
bsd1 = im2hf(B1);%半色调处理
[C11,C21] = decompose(bsd1);%分解得到子图

B2=double(B2)/255;%把矩阵由UNIT8转换为实型 
bsd2 = im2hf(B2);%半色调处理
[C12,C22] = decompose(bsd2);%分解得到子图

B3=double(B3)/255;%把矩阵由UNIT8转换为实型  
bsd3 = im2hf(B3);%半色调处理
[C13,C23] = decompose(bsd3);%分解得到子图

%将三张灰度半色调图恢复成一张彩色半色调图
for i = 1:256
    for j = 1:256
        for k = 1:3
            if k==1
                bsd(i,j,k)=bsd1(i,j);
            end
            if k==2
                bsd(i,j,k)=bsd2(i,j);
            end
            if k==3
                bsd(i,j,k)=bsd3(i,j);
            end
        end
    end
end

figure('name','bsd');
imshow(bsd);
imwrite(bsd,'bsd.bmp');% 半色调图片

%将子图分别叠加得到两张彩色无意义子图
for i = 1:256*2
    for j = 1:256*2
        for k = 1:3
            if k==1
                D1(i,j,k)=C11(i,j);
                D2(i,j,k)=C21(i,j);
            end
            if k==2
                D1(i,j,k)=C12(i,j);
                D2(i,j,k)=C22(i,j);
            end
            if k==3
                D1(i,j,k)=C13(i,j);
                D2(i,j,k)=C23(i,j);
            end
        end
    end
end

figure('name','z1');
imshow(D1);
imwrite(D1,'z1.bmp');% 子图一

figure('name','z2');
imshow(D2);
imwrite(D2,'z2.bmp');% 子图二

E = D1.*D2;%两张图像叠加还原，应该用乘法。

figure('name','y');
imshow(E);
imwrite(E,'y.bmp');% 恢复图片