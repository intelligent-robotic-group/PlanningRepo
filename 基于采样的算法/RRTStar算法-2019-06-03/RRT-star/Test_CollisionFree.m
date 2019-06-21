PointFirst=[238 231 0];
% PointSecond=[275 286 0];
PointSecond=[132 218 0];

global map;
global step;
y1 = PointFirst(2);
y2 = PointSecond(2);
x1=PointFirst(1);
x2=PointSecond(1);
a=(y1-y2)/(x1-x2);
b=y1-a*x1;

i1=x1;
i2=sign(x2-x1)*1;
i3=x2;

X(1,:)=PointFirst(1:2);
X(2,:)=PointSecond(1:2);

% if step<pdist(X) 
%    Result=0
% end 
    
% if isequal(pdist(X),0)==1 
%    Result=0
% end 

for j=i1+i2:i2:i3-i2

    y3=a*j+b;
    c=floor(y3);    
    if map(j,c)==0
        Result=0;%±íÊ¾False£¬ÓÐÅö×²
    else
        Result=1;
        break
    end   
end
Flag=Result