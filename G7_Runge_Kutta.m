%Program-1: The matlab program of EULER METHOD,RUNGE-KUTTA METHOD of 2nd ,4th order.

function runge_kutta
clear all
clear all figure
clc
disp('.....input.....')
x(1)=input('enter the value of independent variable:');
y(1)=input('enter the value of dependent variable:');
h=input('enter the incremenent value:');
n=input('enter the step:');
disp('.....output.....')
eu(1)=y(1);
for i=1:n+1
    eu(i+1)=eu(i)+h*f(x(i),eu(i));
    x(i+1)=x(i)+h;%Euler method
end
ru2(1)=y(1);
for i=1:n+1
    k1=f(x(i),ru2(i));
    k2=f(x(i)+h,ru2(i)+h*k1);
    ru2(i+1)=ru2(i)+(h/2)*(k1+k2);
    x(i+1)=x(i)+h;%2nd order
end
ru4(1)=y(1);
for i=1:n+1
    k1=f(x(i),ru4(i));
    k2=f(x(i)+(h/2),ru4(i)+(h/2)*k1);
    k3=f(x(i)+(h/2),ru4(i)+(h/2)*k2);
    k4=f(x(i)+h,ru4(i)+h*k3);
    ru4(i+1)=ru4(i)+(h/6)*(k1+2*k2+2*k3+k4);
    x(i+1)=x(i)+h;%4th order
end
ru5(1)=y(1);
for i=1:n+1
    k1=f(x(i),ru5(i));
    k2=h*f(x(i)+(h/2),ru5(i)+(1/2)*k1);
    k3=h*f(x(i)+(h/4),ru5(i)+(3*k1+k2)/16);
    k4=h*f(x(i)+(h/2),ru5(i)+(k3/2));
    k5=h*f(x(i)+(3*h/4),ru5(i)+(-3*k2+6*k3+9*k4)/16);
    k6=h*f(x(i)+h,ru5(i)+(k1+4*k2+6*k3-12*k4+8*k5)/7);
    ru5(i+1)=ru5(i)+(7*k1+32*k3+12*k4+32*k5+7*k6)/90;
    x(i+1)=x(i)+h;
end
for i=1:n+1
    fprintf('%f\t%f\t%f\%f\n',x(i),eu(i),ru2(i),ru4(i),ru5(i));
end
plot(x,eu,':r','linewidth',0.5)
hold on
plot(x,ru2,'.-m','linewidth',0.5)
%hold on
%plot(x,ru4,'*m','linewidth',2.0)
%hold on
%plot(x,ru5,'*m','linewidth',2.0)
%hold on
%plot(x,ru6,'*m','linewidth',2.0)
grid on
%y1=x.^2+x-1;
%plot(x,y1,'k')
%title('Graph of x.^2+x-1','fontsize',13);
%legend('Euler solution (red)','RK2 solution(blue)','RK
%solution(megenda)','main solution(black)',2.0);
hold off
function z=f(x,y)
z=-2*x.^3+12*x.^2-20*x+8.5;
