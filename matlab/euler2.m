x=0;y=1;h=0.2;
for x=0:0.2:1
yy=3*x-y
y=y+yy*h
end
y=dsolve('Dy=3*x-y','y(0)=1','x');
x=0:0.2:1;
ys=eval(y)
