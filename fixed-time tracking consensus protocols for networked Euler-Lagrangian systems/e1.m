function [sys,x0,str,ts] = e1(t,x,u,flag)
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
sizes.NumInputs      = 20+4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)


q0_1=u(1+20);
q0_2=u(2+20);

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


e1_1=q1_1-q0_1;
e2_1=q2_1-q0_1;
e3_1=q3_1-q0_1;
e4_1=q4_1-q0_1;
e5_1=q5_1-q0_1;

e1_2=q1_2-q0_2;
e2_2=q2_2-q0_2;
e3_2=q3_2-q0_2;
e4_2=q4_2-q0_2;
e5_2=q5_2-q0_2;

sys(1)=e1_1;
sys(2)=e2_1;
sys(3)=e3_1;
sys(4)=e4_1;
sys(5)=e5_1;

sys(1+5)=e1_2;
sys(2+5)=e2_2;
sys(3+5)=e3_2;
sys(4+5)=e4_2;
sys(5+5)=e5_2;













