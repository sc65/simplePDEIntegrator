function y=Bistabder(x)
    rho = 0.01; rhoa = 0.0001; mu = 0.0015; nu = 0.0025;
    x1 = rho/(1+x(2)*x(2))+rhoa-nu*x(1);
    x2 = rho/(1+x(1)*x(1))+rhoa-nu*x(2);
    y = [x1 x2];
