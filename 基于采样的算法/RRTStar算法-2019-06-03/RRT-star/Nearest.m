function [PointOfNearest,MinDistIndex] = Nearest(V,PointOfRand)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%   输入：当前图信息，顶点(2D)、采样点1*3
%   输出：列表当中和采样点最接近的点
global step;
X(1,:)=PointOfRand(1:2);
%提取V的列长
RowSizeOfV=size(V,1);
%初始化最小距离及索引
MinDist=step;MinDistIndex=RowSizeOfV;
for i=1:RowSizeOfV
    X(2,:)=V(i,1:2);
%     MinDist=pdist(X);
%     d1=sqrt((X(1,:)-X(2,:))*(X(1,:)-X(2,:))');
    if pdist(X)<MinDist
    MinDistIndex=i; %X行表示维度，列表示第几个点
    MinDist=pdist(X);
    end
end
PointOfNearest = V(MinDistIndex,:);
end

