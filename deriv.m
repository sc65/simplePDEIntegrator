function solvepde
global rho rhoa mu nu dif dx dt
rho = 0.0015; rhoa = 0.0001; mu = 0.0015; nu = 0.0025;
dx = 1; dt = 1; nsteps = 10000; nbox = 20; nprint = 1000;
conc = rand(nbox,2);
%conc(1,1) = 1.1;
draw = [ 0.004; 0.4];
dif = draw*dt/(dx*dx);
clf
h=plot(conc(:,1),'r-');
hold on
h2=plot(conc(:,2),'g-');
title('RD System')
axis([1 nbox 0.5 20]);
for i = 1:nsteps
    conc = pdeonestep(conc);
    %refreshdata
    set(h,'YData',conc(:,1));
    set(h2,'YData',conc(:,2));
    xlabel(num2str(i))
    drawnow
end
kdown=conc(:,2)
conc(:,2)=0.1*ones(1,nbox);
for i = 1:nsteps
    conc = pdeonestep(conc);
    conc(:,2)=0.1*ones(1,nbox);
    set(h,'YData',conc(:,1));
    set(h2,'YData',conc(:,2));
    title(i)
    drawnow
end
%plot(conc)
%print -dps after.ps

function nval =  pdeonestep(oval)
    global rho rhoa mu nu dif dx dt
    
    z = calcderiv(oval);
    [m , n ] = size(oval);
    dterms = zeros(m,n);
    for i = 2:m-1
        for j = 1:n
            dterms(i,j) = oval(i,j)-2*oval(i,j)*dif(j)+oval(i+1,j)*dif(j)+oval(i-1,j)*dif(j);
        end
    end
    for j = 1:n
        dterms(1,j) = oval(1,j)-oval(1,j)*dif(j)+oval(2,j)*dif(j);
        dterms(m,j) = oval(m,j)-oval(m,j)*dif(j)+oval(n-1,j)*dif(j);
    end
    nval = z*dt + dterms;
    
function z = calcderiv(y)
    [m,n] = size(y);
    if( ~(n==2) )
        error('must be a 2 column matrix')
    end
    x = zeros(m,n);
    for i = 1:m
        x(i,:)=der(y(i,:));
    end
    z= x;

function y = der(x)
global rho rhoa mu nu

x1 = (rho*x(1)*x(1)+rhoa)/(x(2))-mu*x(1);
x2 = rho*x(1)*x(1)-nu*x(2);
y = [x1 x2];



    
       