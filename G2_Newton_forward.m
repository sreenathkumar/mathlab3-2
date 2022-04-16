% Write a matlab program by using Newton Forward formula..
% % Determine the interpolated value for x=
% The data sets are given below:
% x=[1891 1901 1911 1921 1931];
% y=[9875 132285 168076 195690 246050];

clear fig
disp('Input');
x=[1891 1901 1911 1921 1931];
y=[46 66 81 93 106];
n=length(y);
for i=1:n
d(i,1)=y(i);
end
for i=1:n-1
for j=1:i
d(i+1,j+1)=d(1+i,j)-d(i,j);
end
end
disp([x',d])
xn=input('Enter the required value: ');
h=abs(x(2)-x(1));
u=(xn-x(1))/h;
res=d(1,1);
p=1;
for i=1:n-1;
p=p*(u-i+1);
q=factorial(i);
res=res+(p*d(i+1,i+1))/q;
end
disp('Output');
fprintf('\n The forward interpolation is %f',res);
plot(x,y,'-b')
hold on
plot(xn,res,'ok')
hold off
xlabel('x-axis','fontsize',14)
ylabel('y-axis','fontsize',14)
grid on
