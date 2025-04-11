function I=gauss_eleme(R,E)
T=[R E];
[satir sutun]=size(R);
for n=1:(sutun-1)
    s=1;
    while T(n,n)==0
        if not(T(n+s,n)==0)
            G=T;
            T(n,:)=G(n+s,:);
            T(n+s,:)=G(n,:);
        end
        if s==n
            disp('çözüm yok!'); return
        end
        s=s+1;
    end
    for m=(n+1):(satir)
        T(m,:)=T(m,:)-T(n,:)*T(m,n)/T(n,n);
    end
end
I=zeros(satir,1);
for n=satir:-1:1
    tp=T(n,[sutun:-1:(n+1)])*I([sutun:-1:(n+1)]);
    I(n)=(T(n,sutun+1)-tp)/T(n,n);
end