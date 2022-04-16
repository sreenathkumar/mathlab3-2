 
%curve fitting..........................................................
% F values.....
%enter 1----one degree straight fitting
% enter 2----2nd degree parabolic fitting
%enter 3----cube fitting
%enter 4,5.......so on ....higher order polynomial fitting
%program start..........................................................
clc;
fprintf('""""""""""""""""Curve Fitting """"""""""""""""""""""""""\n');
X=input('enter list of abscissas: ');
Y=input('enter list of ordinates: ');
F=input('how degree are you want : ');

N=F+1;
%A matrix..........................................................
fprintf('The matrix A is =\n');
A=zeros(N,N);
for i=1:N
    for j=1:N
        A(i,j)=sum(X.^(i+j-2));
    end
end
disp(A);

%B Matrix.............................................................
fprintf('\n The matrix B is =\n');
B=zeros(N,1);
for k=1:N
    B(k)=sum(X.^(k-1).*Y);
end
disp(B);

% The inverse Matrix of A..............................................
fprintf('\n The Inverse matrix of A is =\n');
T=inv(A);
disp(A);
%The Matrix of x is.......................................................
fprintf('\n The matrix of U is =\n');
[m1,n1]=size(T);
[m2,n2]=size(B); 
U=zeros(m1,n2);  
 for i=1:m1
     for j=1:n2
       for k=1:n1
           U(i,j)=U(i,j)+T(i,k)*B(k,j);
         
       end
      
     end
  
 end
 disp(U);

 %Print Polynomial equation..............................................
 fprintf('\n The polynomial equation is :\n ');
 for k=N:-1:2
     fprintf('+(%.2fX^%d',U(k),k-1);
 end
 fprintf('+(%.2f)',U(1));
 
 %Draw graph............................................................

p=flip(U);
g=length(X);
x=linspace(X(1),X(g),30);
y=polyval(p,x);
plot(x,y,'r');
grid on;
hold on;
plot(X,Y,'o');

xlabel('x-axis');
ylabel('y-axis');
title('fitting curve','fontsize',9);
legend('  point','fitting curve');
 
%end of the program......................... ..................................   