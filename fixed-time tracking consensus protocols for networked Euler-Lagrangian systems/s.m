function [sys,x0,str,ts] = s(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
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
sizes.NumInputs      = 10+10;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

dote1_1=u(1);
dote2_1=u(2);
dote3_1=u(3);
dote4_1=u(4);
dote5_1=u(5);

dote1_2=u(1+5);
dote2_2=u(2+5);
dote3_2=u(3+5);
dote4_2=u(4+5);
dote5_2=u(5+5);

r1_1=u(1+10);
r2_1=u(2+10);
r3_1=u(3+10);
r4_1=u(4+10);
r5_1=u(5+10);

r1_2=u(1+5+10);
r2_2=u(2+5+10);
r3_2=u(3+5+10);
r4_2=u(4+5+10);
r5_2=u(5+5+10);


s1_1=dote1_1+r1_1;
s2_1=dote2_1+r2_1;
s3_1=dote3_1+r3_1;
s4_1=dote4_1+r4_1;
s5_1=dote5_1+r5_1;

s1_2=dote1_2+r1_2;
s2_2=dote2_2+r2_2;
s3_2=dote3_2+r3_2;
s4_2=dote4_2+r4_2;
s5_2=dote5_2+r5_2;

sys(1)=s1_1;
sys(2)=s2_1;
sys(3)=s3_1;
sys(4)=s4_1;
sys(5)=s5_1;

sys(1+5)=s1_2;
sys(2+5)=s2_2;
sys(3+5)=s3_2;
sys(4+5)=s4_2;
sys(5+5)=s5_2;





