%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 杨旭东
% 1410658
% 彩色，子图有伪装
% 注：输入为一张256×256BMP图片
%     输出为两张512×512BMP子密钥图片
%         和一张512×512BMP还原图片
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','原图')
imshow(A)

[A1,M1] = imread('l2.bmp', 'bmp');
figure('name','伪装1')
imshow(A1)

[A2,M2] = imread('l3.bmp', 'bmp');
figure('name','伪装2')
imshow(A2)

% 将三张彩色图片分别拆分成三张灰度图片以便处理
for i = 1:256
    for j = 1:256
        for k = 1:3
            if k==1
                B1(i,j)=A(i,j,k);
                B11(i,j)=A1(i,j,k);
                B12(i,j)=A2(i,j,k);
            end
            if k==2
                B2(i,j)=A(i,j,k);
                B21(i,j)=A1(i,j,k);
                B22(i,j)=A2(i,j,k);
            end
            if k==3
                B3(i,j)=A(i,j,k);
                B31(i,j)=A1(i,j,k);
                B32(i,j)=A2(i,j,k);
            end
        end
    end
end

B1=double(B1)/255;%把矩阵由UNIT8转换为实型  
B11=double(B11)/255;
B12=double(B12)/255;
bsd1 = im2hf(B1);
bsd11 = im2hf(B11);
bsd12 = im2hf(B12);
[C11,C21] = decwithimg(bsd1,bsd11,bsd12);

B2=double(B2)/255;%把矩阵由UNIT8转换为实型 
B21=double(B21)/255;
B22=double(B22)/255;
bsd2 = im2hf(B2);
bsd21 = im2hf(B21);
bsd22 = im2hf(B22);
[C12,C22] = decwithimg(bsd2,bsd21,bsd22);

B3=double(B3)/255;%把矩阵由UNIT8转换为实型 
B31=double(B31)/255;
B32=double(B32)/255;
bsd3 = im2hf(B3);
bsd31 = im2hf(B31);
bsd32 = im2hf(B32);
[C13,C23] = decwithimg(bsd3,bsd31,bsd32);

%将分别三张灰度半色调图恢复成一张彩色半色调图
for i = 1:256
    for j = 1:256
        for k = 1:3
            if k==1
                bsd(i,j,k)=bsd1(i,j);
                b_sd(i,j,k)=bsd11(i,j);
                bs_d(i,j,k)=bsd12(i,j);
            end
            if k==2
                bsd(i,j,k)=bsd2(i,j);
                b_sd(i,j,k)=bsd21(i,j);
                bs_d(i,j,k)=bsd22(i,j);
            end
            if k==3
                bsd(i,j,k)=bsd3(i,j);
                b_sd(i,j,k)=bsd31(i,j);
                bs_d(i,j,k)=bsd32(i,j);
            end
        end
    end
end

figure('name','bsd');
imshow(bsd);
imwrite(bsd,'bsd.bmp');% 半色调

figure('name','w1');
imshow(b_sd);
imwrite(b_sd,'w1.bmp');% 伪装半色调1

figure('name','w2');
imshow(bs_d);
imwrite(bs_d,'w2.bmp');% 伪装半色调2

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