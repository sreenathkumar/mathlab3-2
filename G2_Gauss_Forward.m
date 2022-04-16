% Write a matlab program by using Gauss Forward centeral formula..
% Determine the interpolated value for x=1935
% The data sets are given below:
% x=[1911 1921 1931 1941 1951];
% y=[15 20 27 39 52];
clc
clear all
syms t

x=[1891 1901 1911 1921 1931];
y=[46 66 81 93 101];
n=length(y);

for i=1:n 
    D(i,1)=y(i); 
end

for j=2:n
    for i=1:n-j+1
        D(i,j)=D(i+1,j-1)-D(i,j-1);
    end 
end
disp([x',D])
z=input('Enter the interplated value: ');
l=input('which derivative do you want = ');
h=abs(x(2)-x(1));
p=(z-x(n-1))/h;
prod(1)=t;
prod(2)=t*(t-1);
prod(3)=t*(t-1)*(t+1);
prod(4)=t*(t-1)*(t+1)*(t-2);

sum=D(1,1)+(prod(1)*D(1,2));
for i=3:n
    sum=sum+(prod(i-1)*D(1,i))/factorial(i);
end


f(t) = sum;
diff_f(t) = diff(f(t), t, l);

fprintf('The required value is: %f',double(f(p)));
