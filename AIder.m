function y=AIder(x)
    rho = 0.0015; rhoa = 0.0001; mu = 0.0015; nu = 0.0025;
    x1 = (rho*x(1)*x(1)+rhoa)/(x(2))-mu*x(1);
    x2 = rho*x(1)*x(1)-nu*x(2);
    y = [x1 x2];
