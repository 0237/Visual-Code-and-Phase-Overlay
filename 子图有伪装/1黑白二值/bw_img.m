%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 1410658
% �ڰ׶�ֵ����ͼ��αװ
% ע������Ϊһ��256��256BMPͼƬ
%     ���Ϊ����512��512BMP����ԿͼƬ
%         ��һ��512��512BMP��ԭͼƬ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','ԭͼ');
imshow(A);

[B1,N1] = imread('l3.bmp', 'bmp');
figure('name','αװ1');
imshow(B1);

[B2,N2] = imread('l4.bmp', 'bmp');
figure('name','αװ2');
imshow(B2);

bw = im2bw(A);
figure('name','��ֵ');
imshow(bw);
imwrite(bw,'bw.bmp');%��ֵͼ

bw1 = im2bw(B1);
figure('name','��ֵ1');
imshow(bw1);
imwrite(bw1,'w1.bmp');%αװ��ֵͼ1

bw2 = im2bw(B2);
figure('name','��ֵ2');
imshow(bw2);
imwrite(bw2,'w2.bmp');%αװ��ֵͼ2

[ C1,C2 ] = decwithimg( bw,bw1,bw2 );% �����Զ��庯��decwithimg()�ֽ�õ���αװ����ͼ

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