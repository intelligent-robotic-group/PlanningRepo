function [PointOfNearest,MinDistIndex] = Nearest(V,PointOfRand)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   ���룺��ǰͼ��Ϣ������(2D)��������1*3
%   ������б��кͲ�������ӽ��ĵ�
global step;
X(1,:)=PointOfRand(1:2);
%��ȡV���г�
RowSizeOfV=size(V,1);
%��ʼ����С���뼰����
MinDist=step;MinDistIndex=RowSizeOfV;
for i=1:RowSizeOfV
    X(2,:)=V(i,1:2);
%     MinDist=pdist(X);
%     d1=sqrt((X(1,:)-X(2,:))*(X(1,:)-X(2,:))');
    if pdist(X)<MinDist
    MinDistIndex=i; %X�б�ʾά�ȣ��б�ʾ�ڼ�����
    MinDist=pdist(X);
    end
end
PointOfNearest = V(MinDistIndex,:);
end

