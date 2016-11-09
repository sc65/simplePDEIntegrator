function nval = pdeonestep(oval,der,dif,dt,nbox,ncomp)
    % nval = pdeonestep(oval,der,dif,dt,nbox,ncomp)
    %----------------------------------
    % Function to advance one step of a pde
    % der is a handle to the function which evaluates the derivative
    % dif is a vector of diffusion constants
    z = zeros(nbox,ncomp);
    tadd = zeros(1,ncomp);
    ovalb = oval;
    ovalb(1,:)=zeros(1,ncomp);
    ovalb(end,:)=zeros(1,ncomp);
    sup = [tadd; oval(1:nbox-1,:)];
    sdown = [oval(2:nbox,:); tadd];
    difmat = dif(:,ones(nbox,1))';
    dterms = oval-oval.*difmat-ovalb.*difmat+sdown.*difmat+sup.*difmat;
    for i = 1:nbox
        z(i,:)=der(oval(i,:),i);
    end
    nval = z*dt + dterms;