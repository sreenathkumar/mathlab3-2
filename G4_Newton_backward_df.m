% Write a matlab program by using Newton Backward Differentiation formula..
% % Determine the interpolated value for x=
% The data sets are given below:
% x=[0 1 2 3 4]; 
% y=[0.3010 0.4771 0.6020 0.6990 0.7782];


clc
clear all

syms t
fprintf('The Backward difference table is given below:\n');
fprintf('         x      y        dy       d^2y       d^3y      d^4y\n\n')

%...Input Section...
x=[0 1 2 3 4]; 
y=[0.3010 0.4771 0.6020 0.6990 0.7782];
n=length(y);
for i=1:n
d(i,1)=y(i);
end

%...Tabular Section...
for i=1:n-1
for j=1:i
d(i+1,j+1)=d(1+i,j)-d(i,j);
end
end

%...Output Section...
disp([x',d])
xn=input('Enter the required value: ');
l=input('which derivative do you want = ');
h=abs(x(2)-x(1));
r=(xn-x(1))/h;
int=d(1,1);
p=1;

for i=1:n-1;
    p=p*(t-i+1);
    q=factorial(i);
    int=int+(p*d(i+1,i+1))/q;
end

diff1c(t)=(1/h.^l)*diff(int,t,l);
fprintf('Value of derivative = %.4f\n',double(diff1c(r)))
