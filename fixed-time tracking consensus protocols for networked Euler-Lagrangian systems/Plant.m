function [sys,x0,str,ts] = Plant(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 20;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 10+10;
sizes.NumInputs      = 10;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0=[4 2 8 9 2  6 1 9 5 6  1 1 1 1 1  3 3 3 1 1];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

q1_1=x(1);
q2_1=x(2);
q3_1=x(3);
q4_1=x(4);
q5_1=x(5);

dotq1_1=x(1+10);
dotq2_1=x(2+10);
dotq3_1=x(3+10);
dotq4_1=x(4+10);
dotq5_1=x(5+10);

q1_2=x(1+5);
q2_2=x(2+5);
q3_2=x(3+5);
q4_2=x(4+5);
q5_2=x(5+5);

dotq1_2=x(1+5+10);
dotq2_2=x(2+5+10);
dotq3_2=x(3+5+10);
dotq4_2=x(4+5+10);
dotq5_2=x(5+5+10);

sys(1)=dotq1_1;
sys(2)=dotq2_1;
sys(3)=dotq3_1;
sys(4)=dotq4_1;
sys(5)=dotq5_1;

sys(1+5)=dotq1_2;
sys(2+5)=dotq2_2;
sys(3+5)=dotq3_2;
sys(4+5)=dotq4_2;
sys(5+5)=dotq5_2;

u1=[u(1);u(1+5)];
u2=[u(2);u(2+5)];
u3=[u(3);u(3+5)];
u4=[u(4);u(4+5)];
u5=[u(5);u(5+5)];

% d1=[sin(1*t+pi/4);1-cos((3-1)*t+pi/6)];
% d2=[sin(2*t+pi/4);1-cos((3-2)*t+pi/6)];
% d3=[sin(3*t+pi/4);1-cos((3-3)*t+pi/6)];
% d4=[sin(4*t+pi/4);1-cos((3-4)*t+pi/6)];
% d5=[sin(5*t+pi/4);1-cos((3-5)*t+pi/6)];

d1=[0;0];
d2=[0;0];
d3=[0;0];
d4=[0;0];
d5=[0;0];

m11=0.7;m12=1.5;m13=0.3;m14=0.5;m15=0.2;
m21=0.8;m22=1.3;m23=0.2;m24=0.3;m25=0.4;
m31=0.5;m32=1.6;m33=0.4;m34=0.4;m35=0.3;
m41=0.6;m42=1.4;m43=0.4;m44=0.3;m45=0.5;
m51=0.5;m52=1.3;m53=0.5;m54=0.4;m55=0.3;

M1=[m11+m12+2*m13*cos(q1_2) m12+m13*cos(q1_2);m12+m13*cos(q1_2) m12];
M2=[m21+m22+2*m23*cos(q2_2) m22+m23*cos(q2_2);m22+m23*cos(q2_2) m22];
M3=[m31+m32+2*m33*cos(q3_2) m32+m33*cos(q3_2);m32+m33*cos(q3_2) m32];
M4=[m41+m42+2*m43*cos(q4_2) m42+m43*cos(q4_2);m42+m43*cos(q4_2) m42];
M5=[m51+m52+2*m53*cos(q5_2) m52+m53*cos(q5_2);m52+m53*cos(q5_2) m52];

C1=-[m13*sin(q1_2)*dotq1_2  m13*sin(q1_2)*(dotq1_1+dotq1_2);-m13*sin(q1_2)*dotq1_1 0];
C2=-[m23*sin(q2_2)*dotq2_2  m23*sin(q2_2)*(dotq2_1+dotq2_2);-m23*sin(q2_2)*dotq2_1 0];
C3=-[m33*sin(q3_2)*dotq3_2  m33*sin(q3_2)*(dotq3_1+dotq3_2);-m33*sin(q3_2)*dotq3_1 0];
C4=-[m43*sin(q4_2)*dotq4_2  m43*sin(q4_2)*(dotq4_1+dotq4_2);-m43*sin(q4_2)*dotq4_1 0];
C5=-[m53*sin(q5_2)*dotq5_2  m53*sin(q5_2)*(dotq5_1+dotq5_2);-m53*sin(q5_2)*dotq5_1 0];

g=9.8;
G1=[m14*cos(q1_1)+m15*g*cos(q1_1+q1_2);m15*cos(q1_1+q1_2)];
G2=[m24*cos(q2_1)+m25*g*cos(q2_1+q2_2);m25*cos(q2_1+q2_2)];
G3=[m34*cos(q3_1)+m35*g*cos(q3_1+q3_2);m35*cos(q3_1+q3_2)];
G4=[m44*cos(q4_1)+m45*g*cos(q4_1+q4_2);m45*cos(q4_1+q4_2)];
G5=[m54*cos(q5_1)+m55*g*cos(q5_1+q5_2);m55*cos(q5_1+q5_2)];

tempt1=inv(M1)*(u1+d1-C1*[dotq1_1;dotq1_2]-G1);
tempt2=inv(M2)*(u2+d2-C2*[dotq2_1;dotq2_2]-G2);
tempt3=inv(M3)*(u3+d3-C3*[dotq3_1;dotq3_2]-G3);
tempt4=inv(M4)*(u4+d4-C4*[dotq4_1;dotq4_2]-G4);
tempt5=inv(M5)*(u5+d5-C5*[dotq5_1;dotq5_2]-G5);

sys(1+10)=tempt1(1);
sys(2+10)=tempt2(1);
sys(3+10)=tempt3(1);
sys(4+10)=tempt4(1);
sys(5+10)=tempt5(1);

sys(1+5+10)=tempt1(2);
sys(2+5+10)=tempt2(2);
sys(3+5+10)=tempt3(2);
sys(4+5+10)=tempt4(2);
sys(5+5+10)=tempt5(2);



function sys=mdlOutputs(t,x,u)



sys(1)=x(1);%智能体1横坐标位置
sys(2)=x(2);%智能体2横坐标位置
sys(3)=x(3);%智能体3横坐标位置
sys(4)=x(4);%智能体4横坐标位置
sys(5)=x(5);%智能体5横坐标位置

sys(1+5)=x(1+5);%智能体1纵坐标位置
sys(2+5)=x(2+5);%智能体2纵坐标位置
sys(3+5)=x(3+5);%智能体3纵坐标位置
sys(4+5)=x(4+5);%智能体4纵坐标位置
sys(5+5)=x(5+5);%智能体5纵坐标位置

sys(1+10)=x(1+10);%智能体1横坐标速度
sys(2+10)=x(2+10);%智能体2横坐标速度
sys(3+10)=x(3+10);%智能体3横坐标速度
sys(4+10)=x(4+10);%智能体4横坐标速度
sys(5+10)=x(5+10);%智能体5横坐标速度

sys(1+5+10)=x(1+5+10);%智能体1纵坐标速度
sys(2+5+10)=x(2+5+10);%智能体2纵坐标速度
sys(3+5+10)=x(3+5+10);%智能体3纵坐标速度
sys(4+5+10)=x(4+5+10);%智能体4纵坐标速度
sys(5+5+10)=x(5+5+10);%智能体5纵坐标速度






