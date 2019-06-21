clear;
clc;
%% 参数初始化
%加载地图
load maze.mat;
global map ;
%确认地图维度及范围 PS注意xy的值与对应的数组
DimensionOneMin=1;
DimensionOneMax=size(map,2);%x
DimensionTwoMin=1;
DimensionTwoMax=size(map,1);%y
DimensionThreeMin=1;
DimensionThreeMax=size(map,3);

%路径起点、终点、步长
PointOfStar=[57,85,0];%x,y,z
PointOfGoal=[370,248,0];

global step ;step=150;

%初始化顶点、边
G=[];
V(1,:)=PointOfStar;S=[];T=[];
E=[];

%n为最大采样点数
n=2000;
Flag_valid=0;
for i=1:n
    %step1 生成无碰撞的点
    PointOfRand=SampleFree(DimensionOneMin,DimensionOneMax,...
    DimensionTwoMin,DimensionTwoMax,...
    DimensionThreeMin,DimensionThreeMax);
    if rand<0.01
        PointOfRand=PointOfGoal;
    end
    %Step2 检索已存在的最近距离点
    [PointOfNearest,IndexPointOfNearest]=Nearest(V,PointOfRand);
    %Step3 检测是否无碰撞且符合距离约束，有效则加入顶点和创造边
    %0为有碰撞，1为没有碰撞
    if CollisionFree(PointOfRand,PointOfNearest)==1 %ObtacleFree==CollisionFree
        Flag_valid=1+Flag_valid;
        PointOfNew=Steer(PointOfNearest,PointOfRand);      
        V(Flag_valid+1,:)=PointOfNew;
        S(Flag_valid,:)=IndexPointOfNearest;
        T(Flag_valid,:)=size(V,1);%IndexPointOfNew;
        E(Flag_valid,:)=pdist([PointOfNearest(1:2);PointOfNew(1:2)]);
    end
    %Step4 检测路径是否到达了终点，输出其最短路径
    if isequal(V(size(V,1),:),PointOfGoal)==1
        break;
    end
    
end
%% 生成图和寻找最短路径
G=graph(S,T,E);
% figure
% plot(G);
[P,d] = shortestpath(G,1,size(V,1));
% G=graph(V,E);

%% 画图，地图，起点、终点、随机的点、树、路径
figure;
%地图
imshow(int32(1 - map), []);
title('RRT (Rapidly-Exploring Random Trees) - Smooth');
hold on;
%起点、终点
plot(PointOfStar(1), PointOfStar(2), 'g*', 'linewidth', 1);
plot(PointOfGoal(1), PointOfGoal(2), 'r*', 'linewidth', 1);
%路径节点
for ii = 2 : size(V,1)-1
plot(V(ii,1), V(ii,2), 'b*', 'linewidth', 1);
end
%扩展树
for jj=1:size(S)
    plot([V(S(jj),1);V(T(jj),1)],[V(S(jj),2);V(T(jj),2)],'c')
end
%最短路径
% for jj = 1 : size(P,2)-1
        %plot(vertices(ii, 1), vertices(ii, 2), 'cyan*', 'linewidth', 1);
        plot(V(P(1,:),1),V(P(1,:),2),'r');
% end