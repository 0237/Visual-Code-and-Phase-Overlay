%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 1410658
% �Ҷȣ���ͼ��αװ
% ע������Ϊһ��256��256BMPͼƬ
%     ���Ϊ����512��512BMP����ԿͼƬ
%         ��һ��512��512BMP��ԭͼƬ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','ԭͼ1')
imshow(A)

[B1,N1] = imread('l3.bmp', 'bmp');
figure('name','αװ1')
imshow(B1)

[B2,N2] = imread('l4.bmp', 'bmp');
figure('name','αװ2')
imshow(B2)

gray = rgb2gray(A);
gray=double(gray)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  
gray1 = rgb2gray(B1);
gray1=double(gray1)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  
gray2 = rgb2gray(B2);
gray2=double(gray2)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  

bsd = im2hf(gray);
figure('name','ԭͼ��ɫ��');
imshow(bsd);
imwrite(bsd,'bsd.bmp');%ԭͼ��ɫ��

bsd1 = im2hf(gray1);
figure('name','αװ��ɫ��1');
imshow(bsd1);
imwrite(bsd1,'w1.bmp');%αװ��ɫ��1

bsd2 = im2hf(gray2);
figure('name','αװ��ɫ��2');
imshow(bsd2);
imwrite(bsd2,'w2.bmp');%αװ��ɫ��1

[ C1,C2 ] = decwithimg( bsd,bsd1,bsd2 );% �����Զ��庯��decwithimg()�ֽ�õ���αװ����ͼ

figure('name','z1');
imshow(C1);
imwrite(C1,'z1.bmp');% ��αװ��ͼһ

figure('name','z2');
imshow(C2);
imwrite(C2,'z2.bmp');% ��αװ��ͼ��

D = C1.*C2;% ����ͼ����ӻ�ԭ��Ӧ���ó˷���

figure('name','y');
imshow(D);
imwrite(D,'y.bmp');% �ָ�ͼƬ