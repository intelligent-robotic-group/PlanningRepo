function [PointOfRand] = SampleFree...
    (DimensionOneMin,DimensionOneMax,...
    DimensionTwoMin,DimensionTwoMax,...
    DimensionThreeMin,DimensionThreeMax)
global map
%在地图中随机采样点
%   输入：三个维度的最小值和最大值，要连续
%   输出：三个维度的采样值
PointOfRand(1,3)=1;
while PointOfRand(1,3)==1
PointOfRand(1,1) = floor(rand*(DimensionOneMax-DimensionOneMin)+DimensionOneMin);
PointOfRand(1,2) = floor(rand*(DimensionTwoMax-DimensionTwoMin)+DimensionTwoMin);
PointOfRand(1,3)=map(PointOfRand(1,2),PointOfRand(1,1));
end

end

