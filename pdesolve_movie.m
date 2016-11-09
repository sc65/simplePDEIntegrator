function pdesolve_movie(ics,der,dif,nstep,dt,yrange)
    [nbox , ncomp ] = size(ics);
    fps =10;
    fig1=figure;
    winsize = get(fig1,'Position');
    winsize(1:2)= [0 0];
    set(fig1,'NextPlot','replacechildren');
    conc=ics;
    h=plot(conc(:,1),'r--');
    hold on
    h2=plot(conc(:,2),'g--');
    hold on
    axis([1 nbox 0 yrange]);
    xlabel('position');
    ylabel('concentration');
    legend('Activator','Inhibitor')
    drawnow
    M(:,1)=getframe(fig1,winsize);
    q=2;
    for i=1:nstep
        conc=pdeonestep(conc,der,dif,dt,nbox,ncomp);
        if mod(i,100)==0
            set(h,'YData',conc(:,1));
            set(h2,'YData',conc(:,2));
            title(num2str(i))
            drawnow
            M(:,q)=getframe(fig1,winsize);
            q=q+1;
        end
    end
%movie(M);
movie2avi(M,'AImovie.avi','fps',fps);