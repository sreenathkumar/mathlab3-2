%Find roots using Newton Rapson Method
clc
clear fig
f=@(x) x.^3-(9*x)+1;
g=@(x) ((9*x)-1).^(1/3);
dg=@(x) [3*((9*x)-1).^(-2/3)];
n=100;
tol=0.0001;
x0=input('Enter the initial value x0= ');
if(dg(x0)>=1)
    disp('There is no roots in x0');
else
    for(i=1:n)
        x=g(x0);
        if abs(x-x0)<tol
            break
        end
        x0=x;
        
    end
end

fprintf('The root is %f',x0);

x=-5:0.1:5;
plot(x,x.^3-(9*x)+1,'b','linewidth',1.5)
hold on
plot(x0,f(x0),'or','linewidth',1.5)
plot([min(x),max(x)],[0,0],'k','linewidth',1.5)
plot([0,0],[-150,150],'k','linewidth',1.5)
h=legend('Graph of a original function',' Real root of a given function',2);
hold off
xlabel('x-axis','FontSize',14)
ylabel('y-axis','FontSize',14)