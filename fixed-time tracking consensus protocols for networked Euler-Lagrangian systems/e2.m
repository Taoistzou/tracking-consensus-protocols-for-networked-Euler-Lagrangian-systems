function [sys,x0,str,ts] = e2(t,x,u,flag)
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
sizes.NumInputs      = 24;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

dotq0_1=u(3+20);
dotq0_2=u(4+20);

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


dote1_1=dotq1_1-dotq0_1;
dote2_1=dotq2_1-dotq0_1;
dote3_1=dotq3_1-dotq0_1;
dote4_1=dotq4_1-dotq0_1;
dote5_1=dotq5_1-dotq0_1;

dote1_2=dotq1_2-dotq0_2;
dote2_2=dotq2_2-dotq0_2;
dote3_2=dotq3_2-dotq0_2;
dote4_2=dotq4_2-dotq0_2;
dote5_2=dotq5_2-dotq0_2;

sys(1)=dote1_1;
sys(2)=dote2_1;
sys(3)=dote3_1;
sys(4)=dote4_1;
sys(5)=dote5_1;

sys(1+5)=dote1_2;
sys(2+5)=dote2_2;
sys(3+5)=dote3_2;
sys(4+5)=dote4_2;
sys(5+5)=dote5_2;







