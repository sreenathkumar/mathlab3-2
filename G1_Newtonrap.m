%Newton Rapson Method
clc
syms x;
y = @(x) x.^3-(3*x)+1;
x0 = input('Enter initial guess: ');
e = 0.001;
N = 100;
i = 1;
g = diff(y,x);
fx0 = eval(subs(y,x,x0));

while abs(fx0)> e
    fx0 = eval(subs(y,x,x0));
    gx0 = eval(subs(g,x,x0));
    if gx0==0
        disp('Division by zero.');
        break;
    end
    
    x1 = x0 - fx0/gx0;
    fprintf('step=%d\tx=%f\tf(x)=%f\n',i,x0,fx0);
    x0 = x1;
    
    if i>N
       disp('Not convergent'); 
       break;
    end
    i=i+1;
end

fprintf('Root is x=%f\n', x0);

%Graph
x=(-2:0.01:2);
plot(x,x.^3-(3*x)+1,'r','linewidth',2)
hold on
plot(x0,0,'*');
plot([-5,5],[0,0])
hold on
plot([-0,0],[-8,8])
hold off
xlabel('X axis','fontsize',14)
ylabel('Y axis','fontsize',14)
grid on
title('graph of the function vs root','fontsize',14)
legend('graph of x^3-2*x-1','root',2)


