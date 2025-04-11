x=1;y=0;h=0.2;
for x=1:0.2:2
yy=(2*x+y)/(2*y-x)
y=y+yy*h
end
y=dsolve('Dy=(2*x+y)/(2*y-x)','y(1)=0','x');
x=1:0.2:2;
ys=eval(y)
