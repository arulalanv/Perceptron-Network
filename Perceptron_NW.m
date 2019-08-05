clear all;
close all;
clc;

%Input patterns
F=[1 1 1 1 1 1 1 -1 -1 ];
L=[1 -1 -1 1 -1 -1 1 1 1];

%Target 
t=[1; -1]

%training Phase 
n=length(F);

%Conversion of Input Patterns into a single matrix 'x'
x(1,1:n)=F;
x(2,1:n)=L;

%Intitialization of weights of inputs
w_old=zeros(1,n);

%Intialization of bias weight 
w0_old=0;

%Bias input
x0=1;

%Intializing learnig rate
alpha=1;

%Computaton of new weights
for i=1:2
    %computing net input
    yin=x(i,1:n)*w_old' +x0*w0_old;
    
    %Apply Activation Function for yin
    if yin>0
        y=1;
    elseif yin==0
        y=0;
    else
        y=-1;
    end
    
    % Checking stopping condition - Is t==y
    if t(i)~=y   
    w_new=w_old + (alpha * x(i,1:n) * t(i))
    w0_new=w0_old + x0*t(i) 
    w_old=w_new;
    w0_old=w0_new;
    else
        w_new=w_old;
        w0_new=w0_old;
    end
end

disp(w0_new);
disp(w_new);

%Testing Phase
pattern=input('Enter the pattern (F or L)=');
ynet = pattern*w_new' + x0*w0_new;

if ynet >=0
    output=1;
else
    output=-1;
end

disp (output);
    
    