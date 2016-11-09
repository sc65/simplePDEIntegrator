dif = [0.02; 0.02];
nbox = 20;
ncomp = 2; % must supply derivative function which evaluates derative
           % for this number of components
nstep=100000;
dt = 1;
yrange=10;
ics= [zeros(10,1) 5*ones(10,1); 5*ones(10,1) zeros(10,1)];
pdesolve(ics,@Bistabder,dif,nstep,dt,yrange);
%ics(:,3:4)=10*rand(nbox,2);
%pdesolve(ics,@AI_morph_der,dif,nstep,dt,yrange);