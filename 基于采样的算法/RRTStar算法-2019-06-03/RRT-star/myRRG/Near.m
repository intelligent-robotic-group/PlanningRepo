function [Xnear] = Near(V,Point)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   ���룺��ǰͼ���㡢����뾶
%   G = graph(s,t,weights);
%   IndexOfPointΪ�õ���Gͼ�е�����
%   radiousΪ����뾶
%   ���; һ��near������V�Ķ���������
%   �Ǿֲ�ת����ĳ�������Lebestue measure��u��Xfree��������
%   dָά��

%   TODO��
%   �ձ��������nά�������,802/3.14/687=0.3718,��ͼ�������ֵҲҪ��
global step;
d=2;
y=2*(1+1/d)^(1/d)*(0.3718)^(1/d);%�ɱ�뾶��������Խ�࣬�뾶Լ��
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

