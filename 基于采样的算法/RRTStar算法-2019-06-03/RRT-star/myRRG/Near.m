function [Xnear] = Near(V,Point)
%UNTITLED2 此处显示有关此函数的摘要
%   输入：当前图、点、开球半径
%   G = graph(s,t,weights);
%   IndexOfPoint为该点在G图中的索引
%   radious为开球半径
%   输出; 一个near区域中V的顶点索引集
%   η局部转向定义的常数？？Lebestue measure（u（Xfree））？？
%   d指维度

%   TODO：
%   勒贝格度量，n维长度相乘,802/3.14/687=0.3718,地图改了这个值也要改
global step;
d=2;
y=2*(1+1/d)^(1/d)*(0.3718)^(1/d);%可变半径，采样点越多，半径约少
radious=min(y*(log(size(V,1))/size(V,1))^(1/d),step);

j=0;
X(1,:)=Point(1:2);
for i=1:size(V,1)
    X(2,:)=V(i,1:2);
    if pdist(X)<radious
        j=j+1;
        Xnear(j)=i;
    end
end
end

