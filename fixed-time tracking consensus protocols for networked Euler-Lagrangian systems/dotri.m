function [sys,x0,str,ts] = dotri(t,x,u,flag)
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
sizes.NumInputs      = 20;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

rho2=0.97;
rho1=rho2/(2-rho2);

dotrho2=1.03;
dotrho1=dotrho2/(2-dotrho2);
k1=1;dotk1=1;k2=2;dotk2=2;

e1_1=u(1);
e2_1=u(2);
e3_1=u(3);
e4_1=u(4);
e5_1=u(5);

e1_2=u(1+5);
e2_2=u(2+5);
e3_2=u(3+5);
e4_2=u(4+5);
e5_2=u(5+5);

dote1_1=u(1+10);
dote2_1=u(2+10);
dote3_1=u(3+10);
dote4_1=u(4+10);
dote5_1=u(5+10);

dote1_2=u(1+5+10);
dote2_2=u(2+5+10);
dote3_2=u(3+5+10);
dote4_2=u(4+5+10);
dote5_2=u(5+5+10);

r1_1=k1*sig(e1_1,rho1)+k2*sig(dote1_1,rho2)+dotk1*sig(e1_1,dotrho1)+dotk2*sig(dote1_1,dotrho2);
r2_1=k1*sig(e2_1,rho1)+k2*sig(dote2_1,rho2)+dotk1*sig(e2_1,dotrho1)+dotk2*sig(dote2_1,dotrho2);
r3_1=k1*sig(e3_1,rho1)+k2*sig(dote3_1,rho2)+dotk1*sig(e3_1,dotrho1)+dotk2*sig(dote3_1,dotrho2);
r4_1=k1*sig(e4_1,rho1)+k2*sig(dote4_1,rho2)+dotk1*sig(e4_1,dotrho1)+dotk2*sig(dote4_1,dotrho2);
r5_1=k1*sig(e5_1,rho1)+k2*sig(dote5_1,rho2)+dotk1*sig(e5_1,dotrho1)+dotk2*sig(dote5_1,dotrho2);

r1_2=k1*sig(e1_2,rho1)+k2*sig(dote1_2,rho2)+dotk1*sig(e1_2,dotrho1)+dotk2*sig(dote1_2,dotrho2);
r2_2=k1*sig(e2_2,rho1)+k2*sig(dote2_2,rho2)+dotk1*sig(e2_2,dotrho1)+dotk2*sig(dote2_2,dotrho2);
r3_2=k1*sig(e3_2,rho1)+k2*sig(dote3_2,rho2)+dotk1*sig(e3_2,dotrho1)+dotk2*sig(dote3_2,dotrho2);
r4_2=k1*sig(e4_2,rho1)+k2*sig(dote4_2,rho2)+dotk1*sig(e4_2,dotrho1)+dotk2*sig(dote4_2,dotrho2);
r5_2=k1*sig(e5_2,rho1)+k2*sig(dote5_2,rho2)+dotk1*sig(e5_2,dotrho1)+dotk2*sig(dote5_2,dotrho2);

sys(1)=r1_1;
sys(2)=r2_1;
sys(3)=r3_1;
sys(4)=r4_1;
sys(5)=r5_1;

sys(1+5)=r1_2;
sys(2+5)=r2_2;
sys(3+5)=r3_2;
sys(4+5)=r4_2;
sys(5+5)=r5_2;










