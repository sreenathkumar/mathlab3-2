% Write a Matlab program by using Newton Backward formula..
% Determine the interpolated value for x=1925
% The data sets are given below:
% x=[1971 1981 1991 2001 2011]; 
% fx=[15 20 26 45 55];
clc
clear all
x=[1971 1981 1991 2001 2011]; 
fx=[15 20 26 45 55];
m=length(fx);
 dt=zeros(m,m+1);
for i=1:m
 dt(i,1)=x(i);  
 dt(i,2)=fx(i); 
end 
n=m-1; 
for j=3:m+1
 for i=1:n
 dt(i,j)=dt(i+1,j-1)-dt(i,j-1);  
 end 
 n=n-1; 
end
fprintf('The forward difference table is given below:\n');
disp(dt)
z=input('The interpolated value is:');
h=x(2)-x(1);
p=(z-x(1))/h;
sum=fx(1);
prod=1;
le=length(fx)-1;
for i=1:le
    prod=prod*(p-i+1);
    sum=sum+(prod*dt(1,i+2))/factorial(i);
       
end

fprintf('The required interpoted value at %.2f is=%.6f',z,sum)

% Graph of a Function
plot(x,fx,':r','LineWidth',2.5)
hold on
plot(z,sum,'ok','LineWidth',1.5)
grid 
legend('Graph of a given data',' Interpolated value',2);
xlabel('x-axis','FontSize',2)
ylabel('y-axis','FontSize',12)
hold off


