%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 1410658
% ��ɫ����ͼ������
% ע������Ϊһ��256��256BMPͼƬ
%     ���Ϊ����512��512BMP����ԿͼƬ
%         ��һ��512��512BMP��ԭͼƬ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
[A,M] = imread('l1.bmp', 'bmp');
figure('name','ԭͼ');
imshow(A);

% ��ֳ����ŻҶ�ͼ
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

B1=double(B1)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  
bsd1 = im2hf(B1);%��ɫ������
[C11,C21] = decompose(bsd1);%�ֽ�õ���ͼ

B2=double(B2)/255;%�Ѿ�����UNIT8ת��Ϊʵ�� 
bsd2 = im2hf(B2);%��ɫ������
[C12,C22] = decompose(bsd2);%�ֽ�õ���ͼ

B3=double(B3)/255;%�Ѿ�����UNIT8ת��Ϊʵ��  
bsd3 = im2hf(B3);%��ɫ������
[C13,C23] = decompose(bsd3);%�ֽ�õ���ͼ

%�����ŻҶȰ�ɫ��ͼ�ָ���һ�Ų�ɫ��ɫ��ͼ
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
imwrite(bsd,'bsd.bmp');% ��ɫ��ͼƬ

%����ͼ�ֱ���ӵõ����Ų�ɫ��������ͼ
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
imwrite(D1,'z1.bmp');% ��ͼһ

figure('name','z2');
imshow(D2);
imwrite(D2,'z2.bmp');% ��ͼ��

E = D1.*D2;%����ͼ����ӻ�ԭ��Ӧ���ó˷���

figure('name','y');
imshow(E);
imwrite(E,'y.bmp');% �ָ�ͼƬ