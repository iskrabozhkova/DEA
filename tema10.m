function tema10
    function z=ff(t,y)
       z=[y(1) - 1; 2*y(1)-y(2)];
    end

    clf;clc
    tmax=5;
    hold on
    grid on
    daspect([1 1 1])
    
    x=-4:1:4
    y=-4:1:4  
    
    [X,Y]=meshgrid(x,y);
    
    %chertaem ravnovesnite tochki na sistemata
    plot(0,0,'r*', 1, 2, 'r*');
    
    %chertaem fazoviq portret
    for i=1:length(x)
        for j=1:length(y)
            [T,Z]=ode45(@ff, [0,tmax], [X(i,j),Y(i,j)]);
            [T1,Z1]=ode45(@ff,[0, -tmax],[X(i,j),Y(i,j)]);
            plot(Z(:,1),Z(:,2),Z1(:,1),Z1(:,2), 'b');
            axis([-5,5,-5,5]);
        end
    end
    
    %tangencialni vektori
    DX=X-1;
    DY=2*X-Y;
    D=sqrt(DX.^2+DY.^2);
    quiver(X,Y,DX./D,DY./D,0.5,'k')
end



