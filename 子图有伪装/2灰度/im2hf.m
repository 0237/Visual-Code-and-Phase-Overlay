function [ I ] = im2hf( B )
% ʵ�ֻҶ�ͼƬ��ɫ��

a=7/16;  
b=3/16;  
c=5/16;  
d=1/16;%�������������  
  
for i=1:256%��ÿ�н��д���  
    for j=1:256%��ÿ�н��д���  
        if B(i,j)<1/2%������ֵ�Ƚ�  
            I(i,j) = 0;  
        else  
            I(i,j) = 1;  
        end  
        if j>1&&j<256&&i<256
            wc=(B(i,j)-I(i,j));%�������  
            B(i,j+1)=B(i,j+1)+wc*a;  
            B(i+1,j-1)=B(i+1,j-1)+wc*b;  
            B(i+1,j)=B(i+1,j)+wc*c;  
            B(i+1,j+1)=B(i+1,j+1)+wc*d;%������  
        end
    end  
end  

end

