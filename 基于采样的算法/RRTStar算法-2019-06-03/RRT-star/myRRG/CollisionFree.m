function [Flag] = CollisionFree(PointFirst,PointSecond)
%UNTITLED3 此处显示有关此函数的摘要
%   检查两点的连线是否有碰撞
%   若有碰撞则返回False
%   若没有碰撞则返回Ture
global map;
global step;
y1 = PointFirst(2);
y2 = PointSecond(2);
x1=PointFirst(1);
x2=PointSecond(1);
%去除点
X(1,:)=PointFirst(1:2);
X(2,:)=PointSecond(1:2);
%去除太近的点
if pdist(X)<1
   Result=0;
   Flag=Result;
   return
end 
%去除太远的点
if step<pdist(X) 
   Result=0;
   Flag=Result;
   return;
end 
% 横坐标相同的情况
if abs(x1-x2)<abs(y1-y2)%斜率较大的时候
    a=(x1-x2)/(y1-y2);%注意要加括号
    b=x1-a*y1;

    i1=y1;
    i2=sign(y2-y1)*1;
    i3=y2;
    % Result=10;
    for j=i1:i2:i3
        x3=a*j+b;
        c=floor(x3);    
        if isequal(map(j,c),1)==1%地图为1是障碍
            Result=0;%表示False，有碰撞
            break 
        else
            Result=1;
        end
    end
    Flag=Result;
else%斜率较小的时候
    a=(y1-y2)/(x1-x2);%注意要加括号
    b=y1-a*x1;

    i1=x1;
    i2=sign(x2-x1)*1;
    i3=x2;
    % Result=10;
    for j=i1:i2:i3
        y3=a*j+b;
        c=floor(y3);    
        if isequal(map(c,j),1)==1%地图为1是障碍
            Result=0;%表示False，有碰撞
            break 
        else
            Result=1;
        end
    end
    Flag=Result;
end

    
%     for jj=y1:sign(y2-y1):y2 
%         if isequal(map(jj,x1),1)==1%地图为1是障碍
%              Result=0;%表示False，有碰撞
%             break 
%         else
%             Result=1;
%         end
%     end
%     Flag=Result;
%     return
% end
%横坐标不同的情况

end

