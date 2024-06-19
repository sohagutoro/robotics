% DH parameters theta d a alpha qlim
L(1) = Link('d', 1, 'a',0, 'alpha', 0,'qlim',[-pi,pi*0.9]);L(1).offset=0;
L(2) = Link('theta', 0, 'a', 0, 'alpha', pi/2,'qlim',[0,2]);L(3).offset=0;
L(3) = Link('d', 0, 'a', 1.5, 'alpha', -pi/2,'qlim',[-pi,pi*0.9]);L(2).offset=-pi/4;
L(4) = Link('d', 0, 'a', 1.5, 'alpha',pi/2,'qlim',[-pi,pi*0.9]);L(4).offset=pi/4;
L(5) = Link('d', 0, 'a', 0, 'alpha',0,'qlim',[0,0]);L(5).offset=0;
L(6) = Link('d', 0, 'a', 1.5, 'alpha',0,'qlim',[-pi,pi*0.9]);L(6).offset=0;
%% Отображение робота-манипулятора
robot= SerialLink(L,'name' , ' ');
robot.display() %Отображение таблицы D-H
h=6; %Параметры рабочего пространства
robot.plotopt = {'workspace',[-h,h,-h,h,0,h],'tilesize',h}; %задаем рабочее пространство 
f = 1;
q = [0 1.0 pi/4 pi/4 pi/4 0]; %Начальный угол звена
figure(f)
robot.teach(q);
title('Пятизвенный манипулятор');
%% 2.2Решение ПЗК
p=robot.fkine(q)
q=ikine(robot,p)
%% 2.3 Планирование траектории
%T1=transl(0.311,2.561,3.025); 
T1 = transl(3, 2, 5);
init_ang=robot.ikine(T1);
T2=transl(0.3, 2.4, 3.0); 
targ_ang=robot.ikine(T2);
step = 10;
f = 2;
figure(f)
%% Метод планирования траектории
%[q, qd, qdd]=jtraj(init_ang, targ_ang, step); 
grid on
T=robot.fkine(q); 
nT=T.T;
plot3(squeeze(nT(1,4,:)),squeeze(nT(2,4,:)),squeeze(nT(3,4,:)));
title('Выходная конечная траектория');
robot.plot(q);

%% Решать изменение позиции, скорости и ускорения.
f = 3;
figure(f)
subplot(3,2,[1,3]); plot3(squeeze(nT(1,4,:)),squeeze(nT(2,4,:)),squeeze(nT(3,4,:))); robot.plot(q);
figure(f)
subplot(3, 2, 2);
i = 1:6; 
plot(q(:,1)); 
title('Положение'); 
grid on;
figure(f) 
subplot(3, 2, 4); 
i= 1:6; plot(qd(:,1)); 
title('скорость'); 
grid on;

figure(f) 
subplot(3, 2, 6); 
i= 1:6; 
plot(qdd(:,1)); 
title('Ускорение'); 
grid on;

t = robot.fkine(q); 
rpy=tr2rpy(t); 
figure(f) 
subplot(3,2,5); 
plot2(rpy);
