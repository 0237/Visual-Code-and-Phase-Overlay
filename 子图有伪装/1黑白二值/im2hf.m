function [ I ] = im2hf( B )
% 实现灰度图片半色调

a=7/16;  
b=3/16;  
c=5/16;  
d=1/16;%定义误差分配规则  
  
for i=1:256%对每行进行处理  
    for j=1:256%对每列进行处理  
        if B(i,j)<1/2%进行阈值比较  
            I(i,j) = 0;  
        else  
            I(i,j) = 1;  
        end  
        if j>1&&j<256&&i<256
            wc=(B(i,j)-I(i,j));%定义误差  
            B(i,j+1)=B(i,j+1)+wc*a;  
            B(i+1,j-1)=B(i+1,j-1)+wc*b;  
            B(i+1,j)=B(i+1,j)+wc*c;  
            B(i+1,j+1)=B(i+1,j+1)+wc*d;%误差分配  
        end
    end  
end  

end

