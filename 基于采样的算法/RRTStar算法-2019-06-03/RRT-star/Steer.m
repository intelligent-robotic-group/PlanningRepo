function [PointOfNew] = Steer(PointOfNearest,PointOfRand)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   ��PointOfNearest�������Ԧ�Ϊ�뾶�Ŀ������ҵ�һ���㡣
%   һ�����PointOfRand��Z�㣬��PointOfNew��
global step ;
% global map ;
X(1,:)=PointOfNearest(1:2);
X(2,:)=PointOfRand(1:2);
if step<pdist(X)
%     [theta,rho] = cart2pol(PointOfNearest(1),PointOfNearest(2));
%     [PointOfNew(1),PointOfNew(2)]=pol2cart(theta,step);
%     PointOfNew(1)=floor(PointOfNew(1));
%     PointOfNew(2)=floor(PointOfNew(2)); 
%     if PointOfNew(1)<1
%         PointOfNew(1)=1;
%     end
%     if PointOfNew(2)<1
%         PointOfNew(2)=1;
%     end
%     if PointOfNew(1)>687
%         PointOfNew(1)=687;
%     end
%     if PointOfNew(2)>802
%         PointOfNew(2)=802;
%     end
%     PointOfNew(3)=map(PointOfNew(1),PointOfNew(2));
    PointOfNew=PointOfNearest;
else
    PointOfNew=PointOfRand;
end
end

