%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 1410658
% �ڰ׶�ֵ����ͼ������
% ע������Ϊһ��256��256BMPͼƬ
%     ���Ϊ����512��512BMP����ԿͼƬ
%         ��һ��512��512BMP��ԭͼƬ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','ԭͼ');
imshow(A);

bwimg = im2bw(A);
figure('name','��ֵ');
imshow(bwimg);
imwrite(bwimg,'bw.bmp');%��ֵͼ

[ C1,C2 ] = decompose( bwimg );% �����Զ��庯��decompose()�ֽ�õ���ͼ

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
