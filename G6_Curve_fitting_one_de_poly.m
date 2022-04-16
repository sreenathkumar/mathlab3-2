 %curve fitting..........................................................
clc;
clear all;
x=input('enter list of abscissas: ');
y=input('enter list of ordinates: ');
m=length(x);
n=length(y);
if(m~=n)
    fprintf('error: The number of element in x must be same in y');
    
else
    sx=sum(x);
    sy=sum(y);
    sxx=sum(x.^2);
    sxy=sum(x.*y);
    
    a=(n*sxy-sx*sy)/(n*sxx-(sx)^2);
     b=(sxx*sy-sxy*sx)/(n*sxx-(sx)^2);
end

fprintf('one degree polynomial equation is: ');
fprintf('%fX+%f\n',a,b);

%plot .....................plot.........................plot..............
plot(x,y,'o');
hold on;
x=x(1):0.1:x(m);
y=a.*x+b;
plot(x,y,'r');

xlabel('x');
ylabel('y');
title('fitting curve','fontsize',9);
legend('  point','fitting curve');
 
%end of the program..................................