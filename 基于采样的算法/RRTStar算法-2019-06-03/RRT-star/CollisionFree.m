function [Flag] = CollisionFree(PointFirst,PointSecond)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �������������Ƿ�����ײ
%   ������ײ�򷵻�False
%   ��û����ײ�򷵻�Ture
global map;
global step;
y1 = PointFirst(2);
y2 = PointSecond(2);
x1=PointFirst(1);
x2=PointSecond(1);
%ȥ����
X(1,:)=PointFirst(1:2);
X(2,:)=PointSecond(1:2);
%ȥ��̫���ĵ�
if pdist(X)<1
   Result=0;
   Flag=Result;
   return
end 
%ȥ��̫Զ�ĵ�
if step<pdist(X) 
   Result=0;
   Flag=Result;
   return;
end 
% ��������ͬ�����
if abs(x1-x2)<abs(y1-y2)%б�ʽϴ��ʱ��
    a=(x1-x2)/(y1-y2);%ע��Ҫ������
    b=x1-a*y1;

    i1=y1;
    i2=sign(y2-y1)*1;
    i3=y2;
    % Result=10;
    for j=i1:i2:i3
        x3=a*j+b;
        c=floor(x3);    
        if isequal(map(j,c),1)==1%��ͼΪ1���ϰ�
            Result=0;%��ʾFalse������ײ
            break 
        else
            Result=1;
        end
    end
    Flag=Result;
else%б�ʽ�С��ʱ��
    a=(y1-y2)/(x1-x2);%ע��Ҫ������
    b=y1-a*x1;

    i1=x1;
    i2=sign(x2-x1)*1;
    i3=x2;
    % Result=10;
    for j=i1:i2:i3
        y3=a*j+b;
        c=floor(y3);    
        if isequal(map(c,j),1)==1%��ͼΪ1���ϰ�
            Result=0;%��ʾFalse������ײ
            break 
        else
            Result=1;
        end
    end
    Flag=Result;
end

    
%     for jj=y1:sign(y2-y1):y2 
%         if isequal(map(jj,x1),1)==1%��ͼΪ1���ϰ�
%              Result=0;%��ʾFalse������ײ
%             break 
%         else
%             Result=1;
%         end
%     end
%     Flag=Result;
%     return
% end
%�����겻ͬ�����

end

