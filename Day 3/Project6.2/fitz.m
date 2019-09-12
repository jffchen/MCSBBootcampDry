% v = cell membrane voltage
% w = activity of ion pumps

%initial conditions
e = 0.08;
a = 0.5;
b = 0.2;

dvdt = @(v,w) v - (1/3)*(v.^3) - w;
dwdt = @(v,w) e*(v + a -b*w);

dxdt = @(t,x) [ dvdt(x(1),x(2));
        dwdt(x(1),x(2)) ]
    
[t,x] = ode45(dxdt,[0,100],[1,1]);

figure(1)
plot(t,x)


%% injected cell



I0 = 1.0;
tStart = 40;
tStop = 47;
I =@(t) I0*(t>tStart).*(t<tStop);









