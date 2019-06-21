step=0.01;


for i=400:600
    for j=400:600
        ConfigureSpace.obs.x(i)=step*i;
        ConfigureSpace.obs.y(j)=step*j;
    end
end

for i=1:1000
    for j=1:1000
        ConfigureSpace.all.x(i)=step*i;
        ConfigureSpace.all.y(j)=step*j;
    end
end

