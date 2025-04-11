function [x,y]=euler_forward(f,xinit,yinit,xfinal,n)
h=(xfinal-xinit)/n;
% Initialization of x and y as column vectors
x=[xinit zeros(1,n)]; y=[yinit zeros(1,n)];
% Calculation of x and y
for i=1:n
x(i+1)=x(i)+h;
y(i+1)=y(i)+h*f(x(i),y(i));
end
end