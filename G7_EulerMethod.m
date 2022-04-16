clc
clear all
close all
%y'=2*x*y;
f=@(x,y) 2*x*y;
fex=@(x) exp(x^2);
 
a=0;
b=1;
n=100;
h=(b-a)/n;
 
ye(1)=1;ym(1)=1;yb(1)=1; %initial condition)
x(1)=a;
 
i=0;
for j=a:h:b
    i=i+1;
    x(i+1)=x(i)+h;
    %euler method:y(n+1)=y(n)+h*f(x(n),y(n))
    ye(i+1)=ye(i)+h*f(x(i),ye(i)); yfe(i)=ye(i);
    %forward euler method
    yb(i+1)=yb(i)+h*f(x(i+1),ye(i+1));ybe(i)=yb(i);
    %modified euler method
    ym(i+1)=ym(i)+0.5*h*(f(x(i),ym(i))+f(x(i+1),ye(i+1))); yme(i)=ym(i);
    %exact solution;
    yex(i)=fex(j);
end
plot(x(1:101),yfe,x(1:101),ybe,x(1:101),yme,x(1:101),yex)
legend('1st equation','2nd equation','3rd equation','4th equation')
grid on
