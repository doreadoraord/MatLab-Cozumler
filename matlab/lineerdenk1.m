R=[3 2 -1;2 -1 2;1 -3 -4];
E=[4;10;5];
I=inv(R)*E;
disp('Dal Akımları:')
% disp(['i1=' num2str(I(1)) ' A'])
% disp(['i2=' num2str(I(2)) ' A'])
% disp(['i3=' num2str(I(3)) ' A'])
fprintf('i1=%g A\n',I(1))
fprintf('i2=%g A\n',I(2))
fprintf('i3=%g A\n',I(3))
