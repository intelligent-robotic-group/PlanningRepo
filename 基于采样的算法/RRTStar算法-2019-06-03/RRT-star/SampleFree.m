function [PointOfRand] = SampleFree...
    (DimensionOneMin,DimensionOneMax,...
    DimensionTwoMin,DimensionTwoMax,...
    DimensionThreeMin,DimensionThreeMax)
global map
%�ڵ�ͼ�����������
%   ���룺����ά�ȵ���Сֵ�����ֵ��Ҫ����
%   ���������ά�ȵĲ���ֵ
PointOfRand(1,3)=1;
while PointOfRand(1,3)==1
PointOfRand(1,1) = floor(rand*(DimensionOneMax-DimensionOneMin)+DimensionOneMin);
PointOfRand(1,2) = floor(rand*(DimensionTwoMax-DimensionTwoMin)+DimensionTwoMin);
PointOfRand(1,3)=map(PointOfRand(1,2),PointOfRand(1,1));
end

end

