clear; close all;

%% The script is a suggested solution to the first exercise in lecture no. 2;
% see also 'Exercise21.m'
%---------------------------------------------------------------------------

%% Input data
a=[5;4.3;3.8;3.6;3.3;2.8;2.2;1.2;0.5]/2;
om=2*pi./[10.3;12;9.4;14;7;6.2;5;4.2;3.3];
delta=2*pi*rand(length(a),1); % Random phases between 0 and 2pi

Tend=100;
dT =  0.01;
time=0:dT:Tend;

%% Question 1: Variance diagram (energy nomalised by gravity and density)

VarAmp = 1/2*a.^2;

%% Question 2: Time history simulation (Question 2)
for i=1:length(a)
    w(i,:)=a(i)*cos(om(i)*time+delta(i));
end

%%  Fourier series approximation 
for n=1:length(a)
    A(n)=dT*sum(w(n,:).*cos(om(n)*time))*2/Tend;
    B(n)=dT*sum(w(n,:).*sin(om(n)*time))*2/Tend;
    zeta(n,:)=A(n)*cos(om(n)*time)+B(n)*sin(om(n)*time);
end
w2=sum(zeta);

%% Plotting
figure(1)
subplot(2,1,1)
bar(om/2/pi,VarAmp,0.1)
hold off
ylabel('½ \zeta^2 [m^2]','fontsize',12)
xlabel('f [Hz]','fontsize',12)
title('Variance diagram','fontsize',14)
box on
grid on
set(gca,'fontsize',14)
axis([0 0.3 0 4])

figure(2)
subplot(4,1,1)
plot(time,w(1,:),'LineWidth',1.5)
hold off
ylabel('\zeta_1(t) [m]','fontsize',14)
% xlabel('Time [minutes]','fontsize',14)
title('Regular wave no. 1','fontsize',14)
box on
grid on
set(gca,'fontsize',14)
axis([0 Tend -2.5 2.5])

figure(3)
subplot(4,1,1)
plot(time,w(2,:),'LineWidth',1.5)
hold off
ylabel('\zeta_2(t) [m]','fontsize',14)
% xlabel('Time [minutes]','fontsize',14)
title('Regular wave no. 2','fontsize',14)
box on
grid on
set(gca,'fontsize',14)
axis([0 Tend -2.5 2.5])

figure(4)
subplot(4,1,1)
plot(time,w(3,:),'LineWidth',1.5)
hold off
ylabel('\zeta_3(t) [m]','fontsize',14)
% xlabel('Time [minutes]','fontsize',14)
title('Regular wave no. 3','fontsize',14)
box on
grid on
set(gca,'fontsize',14)
axis([0 Tend -2.5 2.5])

figure(5)
subplot(4,1,1)
plot(time,w(4,:),'LineWidth',1.5)
hold off
ylabel('\zeta_4(t) [m]','fontsize',14)
% xlabel('Time [minutes]','fontsize',14)
title('Regular wave no. 4','fontsize',14)
box on
grid on
set(gca,'fontsize',14)
axis([0 Tend -2.5 2.5])

figure
subplot(2,1,1)
plot(time,sum(w),'b-','LineWidth',1.5)
hold on
plot(time,w2,'r-.','LineWidth',1.)
hold off
ylabel('\zeta(t) [m]','fontsize',14)
xlabel('t [sec.]','fontsize',14)
title('Sea surface elevation','fontsize',14)
l1=legend('Time history simulation','Fourier series approximation');
set(l1,...
    'Position',[0.492738087438402 0.369529442451916 0.418214293513979 0.0983333354223342]);
box on
grid on
set(gca,'fontsize',12)
axis([0 Tend min(sum(w)) max(sum(w))])