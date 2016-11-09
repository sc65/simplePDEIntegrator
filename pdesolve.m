function pdesolve(ics,der,dif,nstep,dt,yrange)
    [nbox , ncomp ] = size(ics);
    conc=ics;
    clf
    fig1=figure;
    winsize = get(fig1,'Position');
    winsize(1:2)= [0 0];
    set(fig1,'NextPlot','replacechildren');
    h=plot(conc(:,1));
    hold all
    h2=plot(conc(:,2));
    h3=plot(conc(:,3));
    h4=plot(conc(:,4));
    axis([1 nbox 0 yrange]);
    xlabel('position');
    ylabel('concentration');
    title('1');
    drawnow
    M(:,1)=getframe;
    q=2;
    for i=1:nstep
        conc=pdeonestep(conc,der,dif,dt,nbox,ncomp);
        if mod(i,10)==0
            set(h,'YData',conc(:,1));
            set(h2,'YData',conc(:,2));
            set(h3,'YData',conc(:,3));
            set(h4,'YData',conc(:,4));
            title(num2str(i))
            drawnow
            M(:,q)=getframe;
            q=q+1;
        end
    end
