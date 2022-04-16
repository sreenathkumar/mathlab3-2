%%program for interpolationg with lagranges interpolating formula
clc;
clear all;
fprintf('values of x and y\n')
x=[1 2 4 5 7]
y=[52 5 -5 -40 10]
fprintf('numbers of data\n')
n=length(x)
%%input program for taking values of x and y
%{
this part is for taking values from terminal
n=input('inter data number  >');
%%innput section
for i=1:n
    x(i)=input(sprintf('element of x%d  >',i));
    y(i)=input(sprintf('element of y%d  >',i));
end
%}
%%taking interpolating value
reqx=input('enter interpolated number    >');
a(1)=y(1);

%%calculating interpolating value
for i=1:n
    a(i)=1;
    for j=1:n
        if j~=i
            a(i)=a(i)*(reqx-x(j))/(x(i)-x(j));
        end
    end
end
ansi=sum(y.*a);
fprintf('the inter polynominal  is > %.3f \n',ansi);
%%showing figure
%%ploting the datas
v=1:.1:7;
p=1;
for k=1:.1:7
for i=1:n
    a(i)=1;
    for j=1:n
        if j~=i
            a(i)=a(i)*(k-x(j))/(x(i)-x(j));
        end
    end
end
l(p)=sum(y.*a);
p=p+1;
end
plot(v,l);
grid on;
hold on;
plot(reqx,ansi,'or');
xlabel('values of x')
ylabel('values of y')
legend('curve of given data','interpolating point',0)
hold off;
