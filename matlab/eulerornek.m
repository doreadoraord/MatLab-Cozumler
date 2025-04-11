f=@(x,y) x./y;
% Calculate exact solution
g=@(x) sqrt(x.^2+1);
xe=[0:0.01:0.3];
ye=g(xe);
[x1,y1]=euler_forward(f,0,1,0.3,6);
[x2,y2]=euler_modified(f,0,1,0.3,6);
[x3,y3]=euler_backward(f,0,1,0.3,6);

plot(xe,ye,'b-',x1,y1,'k-.',x2,y2,'r:',x3,y3,'g--')
xlabel('x')
ylabel('y')
axis([0 0.3 1 1.07])
error1=['İleri Hata: ' num2str(-100*(ye(end)-y1(end))/ye(end)) '%'];
error2=['İyileştiilmiş Hata: ' num2str(-100*(ye(end)-y2(end))/ye(end)) '%'];
error3=['Geri Hata: ' num2str(-100*(ye(end)-y3(end))/ye(end)) '%'];
error={error1;error2;error3};
text(0.04,1.06,error)
hold on
syms t
yy=dsolve('Dy=t/y','y(0)=1');
yy=inline(yy);
xx=[0.05 0.1 0.15 0.2 0.25 0.3];
plot(xx,yy(xx),'c:')
legend('Analitik Çözüm','İleri Euler','İyileştirilmiş EU','Geri Euler','Sembolik')