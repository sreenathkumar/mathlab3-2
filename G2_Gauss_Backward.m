
% Write a Matlab program by using Gauss Backward central diffrentiation formula..
% Determine the differentiation interpolated value for x=1928
% The data sets are given below:
% x=[1911 1921 1931 1941 1951];
% y=[15 20 27 39 52];
clc
clear all
syms t
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
z=input('Enter the interplated value = ');
l=input('Enter derivative number = ');
h=abs(x(2)-x(1));
p=(z-x(n-1))/h;
prod(1)=t;
prod(2)=t*(t-1);
prod(3)=t*(t-1)*(t+1);
prod(4)=t*(t-1)*(t+1)*(t-2);
% sum(1)=0;
sum=D(5,1)+(prod(1)*D(5,2));
for i=3:n
    sum=sum+(prod(i-1)*D(5,i))/factorial(i);
end
f(t) = sum;
diff_f(t) = diff(f(t), t, l);

fprintf('The required value is: %f',double(diff_f(p)));


