clc,clear,close all;
%% Simulation Parameters
dt =0.01;                     %time step(s)
N=1500;                       %total number of steps
L=2.5;                       %wheelbase (m)
v_const=20;                 %constant vehicle speed (m/s

%% preallocate arrays
x=zeros(1,N);           % X Position(m)            
y=zeros(1,N);           % Y Position(m)
theta=zeros(1,N);          % heading angle (rad)
v=v_const*ones(1,N);        %velocity (m/s)
delta=zeros(1,N);           % steering angle

%% Initial Conditions
x(1)=0;                
y(1) =0;
theta(1)=0;          %Along the X-axis

%% Steering Profile - Lane change 
t_half = 0:dt:2.49;      %duration for each half of manoever (-2.5s)
% Steer left
delta (401:400+length(t_half)) = deg2rad(5) * sin(pi*t_half / max(t_half));
% Steer right
delta(401+length(t_half):400+2*length(t_half)) = -deg2rad(5) *sin(pi*t_half/max(t_half));
% Straighten out
delta (400+2*length(t_half)+1:end) =0;
%% Simulation loop 
for i =1 :N-1
    x(i+1) = x(i) + v(i) * cos(theta(i))*dt;
    y(i+1) = y(i) + v(i) * sin(theta(i))*dt;
    theta(i+1) = theta(i) + (v(i)/L) * tan(delta(i))*dt;
end
%% Trajectory plot
figure (1)
plot(x,y,'r','LineWidth',2);
%barh (x)
% scatter (x(1),y(1),80,'g','filled'); %start point
% scatter (x(end),y(end),80,'r','filled'); %end point
xlabel ('X Position (m)');
ylabel ('Y Position (m)');
title ('Miata 2d Trajectory-Lane change')
grid on
axis equal
legend('Trajectory','Start','End','Location','best')
%%   Trajectory animation
figure 
car_marker = plot(x(1),y(1),'wo','MarkerFaceColor','w','MarkerSize',8);
hold on
scatter (x(1),y(1),80,'g','filled') %start point
scatter (x(end),y(end),80,'r','filled'); %end point
plot (x,y,'--b'); 
xlabel ('X Position(m)');
ylabel('Y position(m)');
title ('Miata 2D Trajectory Animation')
axis equal
grid on
for i=1:5:N
    set(car_marker,'XData',x(i),'YData',y(i));
    drawnow
end