% Write a matlab program by using Newton Forward Differentiation formula..
% % Determine the interpolated value for x=
% The data sets are given below:
% x=[0 1 2 3 4];
% y=[0.3010 0.4771 0.6020 0.6990 0.7782];

clc
clear all
syms t 

%...Input Section...
x=[0 1 2 3 4]; 
y=[0.3010 0.4771 0.6020 0.6990 0.7782];
m=length(y);
 dt=zeros(m,m+1);
for i=1:m
 dt(i,1)=x(i);  
 dt(i,2)=y(i); 
end 
n=m-1; 

%...Tabular Section...
for j=3:m+1
 for i=1:n
 dt(i,j)=dt(i+1,j-1)-dt(i,j-1);  
 end 
 n=n-1; 
end
fprintf('The forward difference table is given below:\n');
fprintf('         x      y        dy       d^2y       d^3y      d^4y\n\n')
disp(dt)
z=input('The interpolated value is: ');
l=input('which derivative do you want = ');
h=x(2)-x(1);
p=(z-x(1))/h;
sum=y(1);
prod=1;
le=length(y)-1;

for i=1:le
    prod=prod*(t-i+1);
    sum=sum+(prod*dt(1,i+2))/factorial(i);   
end

%...Output Section...
diff1c(t)=(1/h.^l)*diff(sum,t,l);
fprintf('Value of derivative = %.4f\n',double(diff1c(p)))