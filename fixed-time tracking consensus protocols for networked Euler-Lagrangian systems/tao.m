function [sys,x0,str,ts] = tao(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u);
case {1,2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 10;
sizes.NumInputs      = 70+4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

q1_1=u(1);
q2_1=u(2);
q3_1=u(3);
q4_1=u(4);
q5_1=u(5);

q1_2=u(1+5);
q2_2=u(2+5);
q3_2=u(3+5);
q4_2=u(4+5);
q5_2=u(5+5);

q1=[q1_1;q1_2];
q2=[q2_1;q2_2];
q3=[q3_1;q3_2];
q4=[q4_1;q4_2];
q5=[q5_1;q5_2];

dotq1_1=u(1+10);
dotq2_1=u(2+10);
dotq3_1=u(3+10);
dotq4_1=u(4+10);
dotq5_1=u(5+10);

dotq1_2=u(1+5+10);
dotq2_2=u(2+5+10);
dotq3_2=u(3+5+10);
dotq4_2=u(4+5+10);
dotq5_2=u(5+5+10);

dotq1=[dotq1_1;dotq1_2];
dotq2=[dotq2_1;dotq2_2];
dotq3=[dotq3_1;dotq3_2];
dotq4=[dotq4_1;dotq4_2];
dotq5=[dotq5_1;dotq5_2];

xi1_1=u(1+20);
xi2_1=u(2+20);
xi3_1=u(3+20);
xi4_1=u(4+20);
xi5_1=u(5+20);

xi1_2=u(1+5+20);
xi2_2=u(2+5+20);
xi3_2=u(3+5+20);
xi4_2=u(4+5+20);
xi5_2=u(5+5+20);

xi1=[xi1_1;xi1_2];
xi2=[xi2_1;xi2_2];
xi3=[xi3_1;xi3_2];
xi4=[xi4_1;xi4_2];
xi5=[xi5_1;xi5_2];



eta1_1=u(1+30);
eta2_1=u(2+30);
eta3_1=u(3+30);
eta4_1=u(4+30);
eta5_1=u(5+30);

eta1_2=u(1+5+30);
eta2_2=u(2+5+30);
eta3_2=u(3+5+30);
eta4_2=u(4+5+30);
eta5_2=u(5+5+30);

eta1=[eta1_1;eta1_2];
eta2=[eta2_1;eta2_2];
eta3=[eta3_1;eta3_2];
eta4=[eta4_1;eta4_2];
eta5=[eta5_1;eta5_2];



r1_1=u(1+40);
r2_1=u(2+40);
r3_1=u(3+40);
r4_1=u(4+40);
r5_1=u(5+40);

r1_2=u(1+45);
r2_2=u(2+45);
r3_2=u(3+45);
r4_2=u(4+45);
r5_2=u(5+45);

r1=[r1_1;r1_2];
r2=[r2_1;r2_2];
r3=[r3_1;r3_2];
r4=[r4_1;r4_2];
r5=[r5_1;r5_2];

dotr1_1=u(1+50);
dotr2_1=u(2+50);
dotr3_1=u(3+50);
dotr4_1=u(4+50);
dotr5_1=u(5+50);

dotr1_2=u(1+55);
dotr2_2=u(2+55);
dotr3_2=u(3+55);
dotr4_2=u(4+55);
dotr5_2=u(5+55);

dotr1=[dotr1_1;dotr1_2];
dotr2=[dotr2_1;dotr2_2];
dotr3=[dotr3_1;dotr3_2];
dotr4=[dotr4_1;dotr4_2];
dotr5=[dotr5_1;dotr5_2];

s1_1=u(1+60);
s2_1=u(2+60);
s3_1=u(3+60);
s4_1=u(4+60);
s5_1=u(5+60);

s1_2=u(1+65);
s2_2=u(2+65);
s3_2=u(3+65);
s4_2=u(4+65);
s5_2=u(5+65);

% deta1_1=u(1+80);
% deta2_1=u(2+80);
% deta3_1=u(3+80);
% deta4_1=u(4+80);
% deta5_1=u(5+80);
% 
% deta1_2=u(1+5+80);
% deta2_2=u(2+5+80);
% deta3_2=u(3+5+80);
% deta4_2=u(4+5+80);
% deta5_2=u(5+5+80);
% 
% deta1=[deta1_1;deta1_2];
% deta2=[deta2_1;deta2_2];
% deta3=[deta3_1;deta3_2];
% deta4=[deta4_1;deta4_2];
% deta5=[deta5_1;deta5_2];



s1=[s1_1;s1_2];
s2=[s2_1;s2_2];
s3=[s3_1;s3_2];
s4=[s4_1;s4_2];
s5=[s5_1;s5_2];

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

alpha=20;beta=20;mu=0.3;nu=3.1;

A=-[3/7 5/14;-5/7 4/7];
x_1=u(1+70);
x_2=u(2+70);
x_3=u(3+70);
x_4=u(4+70);
tempt=A*[x_1+x_3;x_2+x_4];
LL=0;%LL=5;
tao1=G1-C1*(r1-eta1)-M1*(dotr1-tempt)-LL*sign(s1)-alpha.*sig(s1,mu)-beta.*sig(s1,nu);
tao2=G2-C2*(r2-eta2)-M2*(dotr2-tempt)-LL*sign(s2)-alpha.*sig(s2,mu)-beta.*sig(s2,nu);
tao3=G3-C3*(r3-eta3)-M3*(dotr3-tempt)-LL*sign(s3)-alpha.*sig(s3,mu)-beta.*sig(s3,nu);
tao4=G4-C4*(r4-eta4)-M4*(dotr4-tempt)-LL*sign(s4)-alpha.*sig(s4,mu)-beta.*sig(s4,nu);
tao5=G5-C5*(r5-eta5)-M5*(dotr5-tempt)-LL*sign(s5)-alpha.*sig(s5,mu)-beta.*sig(s5,nu);

sys(1)=tao1(1);
sys(2)=tao2(1);
sys(3)=tao3(1);
sys(4)=tao4(1);
sys(5)=tao5(1);

sys(1+5)=tao1(2);
sys(2+5)=tao2(2);
sys(3+5)=tao3(2);
sys(4+5)=tao4(2);
sys(5+5)=tao5(2);










