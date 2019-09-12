% Simulate a discrete-time dynamical system

% x- population
% n- time in WEEKS

nMax = 1000;% max number of days to simulate
x = ones(1,nMax); % population
x(1) = 0.2; % initial condition

%parameter sweep
K = 0.6 %carrying capcity constant
maxpara = 3
ipara = 0.1

figure; hold on;
for r=ipara:0.1:maxpara %per capita growth rate

for n=2:nMax
    
    x(n) = x(n-1) + r*(1-(x(n-1))/K).*(x(n-1));
    
end % finished loop through days

plot(r,x(500:end),'-o');

end
