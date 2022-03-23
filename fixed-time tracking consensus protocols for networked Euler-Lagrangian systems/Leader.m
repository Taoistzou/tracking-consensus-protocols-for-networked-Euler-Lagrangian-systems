function [sys,x0,str,ts] = Leader(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [2 -1 1 3 ];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

sys(1)=x(3);
sys(2)=x(4);

A=-[3/7 5/14;-5/7 4/7];
tempt=A*[x(1)+x(3);x(2)+x(4)];
sys(3)=tempt(1);% sys(3)=-3/7*(x(1)+x(3))-5/14*(x(2)+x(4));
sys(4)=tempt(2);% sys(4)=5/7*(x(1)+x(3))-4/7*(x(2)+x(4));


function sys=mdlOutputs(t,x,u)

sys(1)=x(1);%横坐标位置
sys(2)=x(2);%纵坐标位置
sys(3)=x(3);%横坐标速度
sys(4)=x(4);%纵坐标速度



