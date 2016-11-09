dif = [ 0.004; 0.4; 0.2; 0.2];
nbox = 20;
ncomp = 4; % must supply derivative function which evaluates derative
           % for this number of components
nstep=8000;
dt = 1;
yrange=10;
ics=ones(nbox,4);
ics(1,1)=1.1;
ics(:,3:4)=zeros(nbox,2);
pdesolve(ics,@AI_morph_der,dif,nstep,dt,yrange);
%ics(:,3:4)=10*rand(nbox,2);
%pdesolve(ics,@AI_morph_der,dif,nstep,dt,yrange);