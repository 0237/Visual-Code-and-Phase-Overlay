%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 1410658
% �Ҷȣ���ͼ������
% ע������Ϊһ��256��256BMPͼƬ
%     ���Ϊ����512��512BMP����ԿͼƬ
%         ��һ��512��512BMP��ԭͼƬ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;  
  
im=imread('l1.bmp');  
A=rgb2gray(im);  
B=double(A)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  
  
I = im2hf(B); %�����Զ��庯��im2hf()ת��Ϊ��ɫ��ͼ��
  
figure('name','��ɫ��');
imshow(I);
imwrite(I,'hf.bmp');% ��ɫ��ͼƬ

[C1,C2] = decompose(I);% �����Զ��庯��decompose()�ֽ�õ���ͼ

figure('name','C1');
imshow(C1);
imwrite(C1,'z1.bmp');% ��ͼһ

figure('name','C2');
imshow(C2);
imwrite(C2,'z2.bmp');% ��ͼ��

D = C1.*C2;% ����ͼ����ӻ�ԭ��Ӧ���ó˷���

figure('name','D');
imshow(D);
imwrite(D,'y.bmp');% �ָ�ͼƬ