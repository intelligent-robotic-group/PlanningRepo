function [PointOfNew] = Steer(PointOfNearest,PointOfRand)
%UNTITLED4 此处显示有关此函数的摘要
%   在PointOfNearest附近，以η为半径的开球中找到一个点。
%   一个最靠近PointOfRand的Z点，即PointOfNew。
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

