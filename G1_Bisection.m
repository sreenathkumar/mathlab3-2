%Find out Bisection method

clc
clear all
clear fig
f=@(x) x.^3-9*x+1;
disp('Enter two interval a & b');
a=input('Enter the value of a= ');
b=input('Enter the  value of b= ');
n=input('Enter number of iterations n= ');
tollerance=0.0001;
fa=f(a);
fb=f(b);
if(fa*fb>0)
    fprintf('There is no root between %f & %f',a,b);
elseif(fa==0)
    fprintf('The root is %d',a);
elseif(fb==0)
    fprintf('The root is %d',b);
else
    fprintf('The root lies between %d and %d\n',a,b);
end
disp('No. iteration         Root        Functional Value');
for(i=2:n)
    r=(a+b)/2;
    fr=f(r);
    if(fa*fr<0)
        b=r;
    elseif(fb*fr<0)
        a=r;
    end
    nr(1)=0;
    nr(i)=r;
    if(abs((nr(i)-nr(i-1))/nr(i))<tollerance)
        break
    end
    fprintf('\n\t%d\t\t%f\t\t%f\n',i,r,fr);
end
fprintf('The root is x=%f',r);


x=-5:0.1:5;
plot(x,x.^3-9*x+1,'b','linewidth',1.5)
hold on
plot(r,fr,'or','linewidth',1.5)
plot([min(x),max(x)],[0,0],'k','linewidth',1.5)
plot([0,0],[-150,150],'k','linewidth',1.5)
h=legend('Graph of a original function',' Real root of a given function',2);
hold off
xlabel('x-axis','FontSize',14)
ylabel('y-axis','FontSize',14)