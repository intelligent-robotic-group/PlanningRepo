clear;
clc;
%% ������ʼ��
%���ص�ͼ
load maze.mat;
global map ;
%ȷ�ϵ�ͼά�ȼ���Χ PSע��xy��ֵ���Ӧ������
DimensionOneMin=1;
DimensionOneMax=size(map,2);%x
DimensionTwoMin=1;
DimensionTwoMax=size(map,1);%y
DimensionThreeMin=1;
DimensionThreeMax=size(map,3);

%·����㡢�յ㡢����
PointOfStar=[57,85,0];%x,y,z
PointOfGoal=[370,248,0];

global step ;step=150;

%��ʼ�����㡢��
G=[];
V(1,:)=PointOfStar;S=[];T=[];
E=[];

%nΪ����������
n=2000;
Flag_valid=0;
for i=1:n
    %step1 ��������ײ�ĵ�
    PointOfRand=SampleFree(DimensionOneMin,DimensionOneMax,...
    DimensionTwoMin,DimensionTwoMax,...
    DimensionThreeMin,DimensionThreeMax);
    if rand<0.01
        PointOfRand=PointOfGoal;
    end
    %Step2 �����Ѵ��ڵ���������
    [PointOfNearest,IndexPointOfNearest]=Nearest(V,PointOfRand);
    %Step3 ����Ƿ�����ײ�ҷ��Ͼ���Լ������Ч����붥��ʹ����
    %0Ϊ����ײ��1Ϊû����ײ
    if CollisionFree(PointOfRand,PointOfNearest)==1 %ObtacleFree==CollisionFree
        Flag_valid=1+Flag_valid;
        PointOfNew=Steer(PointOfNearest,PointOfRand);      
        V(Flag_valid+1,:)=PointOfNew;
        S(Flag_valid,:)=IndexPointOfNearest;
        T(Flag_valid,:)=size(V,1);%IndexPointOfNew;
        E(Flag_valid,:)=pdist([PointOfNearest(1:2);PointOfNew(1:2)]);
    end
    %Step4 ���·���Ƿ񵽴����յ㣬��������·��
    if isequal(V(size(V,1),:),PointOfGoal)==1
        break;
    end
    
end
%% ����ͼ��Ѱ�����·��
G=graph(S,T,E);
% figure
% plot(G);
[P,d] = shortestpath(G,1,size(V,1));
% G=graph(V,E);

%% ��ͼ����ͼ����㡢�յ㡢����ĵ㡢����·��
figure;
%��ͼ
imshow(int32(1 - map), []);
title('RRT (Rapidly-Exploring Random Trees) - Smooth');
hold on;
%��㡢�յ�
plot(PointOfStar(1), PointOfStar(2), 'g*', 'linewidth', 1);
plot(PointOfGoal(1), PointOfGoal(2), 'r*', 'linewidth', 1);
%·���ڵ�
for ii = 2 : size(V,1)-1
plot(V(ii,1), V(ii,2), 'b*', 'linewidth', 1);
end
%��չ��
for jj=1:size(S)
    plot([V(S(jj),1);V(T(jj),1)],[V(S(jj),2);V(T(jj),2)],'c')
end
%���·��
% for jj = 1 : size(P,2)-1
        %plot(vertices(ii, 1), vertices(ii, 2), 'cyan*', 'linewidth', 1);
        plot(V(P(1,:),1),V(P(1,:),2),'r');
% end