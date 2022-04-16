% Write a Matlab program by using Gauss Forward central formula..
% Determine the interpolated value for x=1928
% The data sets are given below:
% x=[1911 1921 1931 1941 1951];
% y=[15 20 27 39 52]; 
clc
clear all
x=[1911 1921 1931 1941 1951];
y=[15 20 27 39 52];
n=length(y);
for i=1:n
    D(i,1)=y(i);
end
for i=1:n-1
    for j=1:i
        D(i+1,j+1)=D(i+1,j)-D(i,j);
    end
end
disp([x',D])
z=input('Enter the interplated value: ');
h=abs(x(2)-x(1));
p=(z-x(n-1))/h;
prod(1)=p;
prod(2)=p*(p-1);
prod(3)=p*(p-1)*(p+1);
prod(4)=p*(p-1)*(p+1)*(p-2);
sum(1)=0;
sum(2)=sum(1)+D(4,1)+(prod(1)*D(4,2));
for i=3:n
    sum(i)=sum(i-1)+(prod(i-1)*D(5,i))/factorial(i);
end
fprintf('The required value is: %f',sum(n));
%graph
plot(x,y)
hold on
plot(z,sum(n),'o')