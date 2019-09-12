% Simulate a discrete-time dynamical system

% x- population
% n- time in WEEKS

nMax = 100;% max number of days to simulate
x = ones(1,nMax); % population
x(1) = 0.2; % initial condition
r = 2.5 %per capita growth rate
K = 0.6 %carrying capcity



for n=2:nMax
    
    x(n+1) = x(n) + r*(1-(x(n))/K)*x(n);

    
    
end % finished loop through days

figure;
plot(x,'-ok');