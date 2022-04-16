%%program for interpolationg with newtons divided difference formula
clc;
clear all;
%%input program for taking values of x and y
fprintf('values of x and y\n')
x=[1 3 4 6 7]
y=[-10 5 -15 40 52]
fprintf('numbers of data')
n=length(x)
%{
this part for taking values from terminal
n=input('inter data number  >');

for i=1:n
    x(i)=input(sprintf('element of x%d  >',i));
    y(i)=input(sprintf('element of y%d  >',i));
end
%}
reqx=input('enter interpolated number    >');
a(1)=y(1);
%%program for finding 1st diviation
for i=1:n-1
    m(i,1)=(y(i+1)-y(i))/(x(i+1)-x(i));
end;
  %%program for finding 2nd to nth diviation
for j=2:n-1
    for i=1:n-j
        m(i,j)=(m(i,j-1)-m(i+1,j-1))/(x(i)-x(j+i));
    end
end
 %%program for finding value of a
for j=2:n
    a(j)=m(1,j-1);
end
 %%calculation section for finding value in point x
b(1,1)=1;
b(2,1)=(reqx-x(1));
xter(1)=1;
xter(2)=b(2,1);
for j=1:n
    for i=3:j
        b(i)=(reqx-x(i-1))*b(i-1);
        xter(i)=b(i);
    end
end
ansi=0;
for i=1:n
    ans(i)=ansi+a(i)*xter(i);
    ansi=ans(i);
end
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
legend('curve of given data','interpolating point',2)
hold off;