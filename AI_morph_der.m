function y=AI_morph_der(x,i)
    rho = 0.0015; rhoa = 0.0001; mu = 0.0015; nu = 0.0025;
    kb = 0.01; ku = 0.00001;
    x1 = (rho*x(1)*x(1)+rhoa)/(x(2))-mu*x(1);
    x2 = rho*x(1)*x(1)-nu*x(2)-kb*x(2)*x(3)+ku*x(4);
    x3 = -kb*x(2)*x(3)+ku*x(4);
    x4 = kb*x(2)*x(3)-ku*x(4);
    y = [x1 x2 x3 x4];