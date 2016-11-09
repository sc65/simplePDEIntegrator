dif = [ 0.1; 0; 0; 0];
nbox = 50;
ncomp = 4; % must supply derivative function which evaluates derative
           % for this number of components
nstep=2000;
dt = 1;
yrange=10;
ics=zeros(nbox,ncomp);
pdesolve(ics,@morphsimp_der,dif,nstep,dt,yrange);
%ics(:,3:4)=10*rand(nbox,2);
%pdesolve(ics,@AI_morph_der,dif,nstep,dt,yrange);