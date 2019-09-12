%Index
%   I = inactive protein
%   A = active protein
%   AP= complex: active protein-phosphatase
%   P = unbound phosphatase
        % P = Ptot - AP
%   IK= complex: inactive protein-kinase
%   K = unbound kinase
        % K = Ktot - IK

       
% rate parameters
konA = 10;
koffA = 10;
konI = 10;
koffI = 10;
kcatI = 10;
kcatA = 100;

%initial conditions
Itot = 1
Ktot = 1
Ptot = 1


       
% given eq

% active protein
dAdt =@(A,AP,IK,I) -konA*(Ptot-AP)*A + koffA*AP + kcatA*IK;

%AP/P complex
dAPdt=@(A,AP,IK,I) konA*(Ptot-AP)*A - koffA*AP + kcatI*AP;

%inactive protein
dIdt  =@(A,AP,IK,I) -konI*(Ktot-IK)*I + koffI*IK + kcatI*AP;

%I/K complex
dIKdt =@(A,AP,IK,I) konI*(Ktot-IK)*I - koffI*IK - kcatI*AP;


%ode setup
dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
    dAPdt(x(1),x(2),x(3),x(4));
    dIdt(x(1),x(2),x(3),x(4));
    dIKdt(x(1),x(2),x(3),x(4)) ];
       
%solve system
[T,X] = ode45(dxdt,[0,100],[0,0,0,Itot]);


plot(T,X)

