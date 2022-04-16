% Regular False Method
clc
clear all
syms x;
y = @(x) x.^3-x-1;
a = input('Enter first guess: ');
b = input('Enter second guess: ');
e = input('Tolerable error: ');
fa = eval(subs(y,x,a));
fb = eval(subs(y,x,b));
if fa*fb > 0 
    disp('Given initial values do not bracket the root.');
elseif fa==0
    fprintf('The root is %f',a);
elseif fb==0
    fprintf('The root is %f',b);
else
    c = a - (a-b) * fa/(fa-fb);
    fc = eval(subs(y,x,c));
    fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
   while abs(fc)>e
        fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
        if fa*fc< 0
            b =c;
            fb = eval(subs(y,x,b));
        else
            a =c;
            fa = eval(subs(y,x,a));
        end
        c = a - (a-b) * fa/(fa-fb);
        fc = eval(subs(y,x,c));
   end
    fprintf('\nRoot is: %f\n', c);
end
y=@(x) x.^3-x-1;
x=-7:.0001:7;
plot(x,y(x));
hold on;
grid on;
plot(c,0,'r*');
hold off;
xlabel('X axis','fontsize',14)
ylabel('Y axis','fontsize',14)
grid on

