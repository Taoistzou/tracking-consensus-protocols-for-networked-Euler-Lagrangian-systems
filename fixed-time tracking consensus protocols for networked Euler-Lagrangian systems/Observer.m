function [sys,x0,str,ts]=Observer(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 10+10;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 20;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[1.6 1.4 2 1.2 1.8    1.6 1.4 2 1.2 1.8  2 0.8 11.6 1 1.5     2 0.8 11.6 1 1.5];
str=[];
ts=[0 0];
function sys=mdlDerivatives(t,x,u)
aij_1=[0 0 0 0 1;
       1 0 0 0 0;
       0 1 0 0 0;
       0 0 1 0 0;
       0 0 0 1 0];   
   
aij_2=[0 0 0 0 1;
       1 0 0 0 0;
       0 1 0 0 0;
       0 0 1 0 0;
       0 0 0 1 0];
 p=7;q=11;lamda=10;alpha=8;beta=10;
 
 xi1_1=x(1);
 xi2_1=x(2);
 xi3_1=x(3);
 xi4_1=x(4);
 xi5_1=x(5);
 
 xi1_2=x(1+5);
 xi2_2=x(2+5);
 xi3_2=x(3+5);
 xi4_2=x(4+5);
 xi5_2=x(5+5);
 
 eta1_1=x(1+10);
 eta2_1=x(2+10);
 eta3_1=x(3+10);
 eta4_1=x(4+10);
 eta5_1=x(5+10);
 
 eta1_2=x(1+5+10);
 eta2_2=x(2+5+10);
 eta3_2=x(3+5+10);
 eta4_2=x(4+5+10);
 eta5_2=x(5+5+10);
 
 b=[1 0 0 0 1];
 
 x0_1=u(1);%领导者横坐标位置
 x0_2=u(2);%领导者纵坐标位置
 v0_1=u(3);%领导者横坐标速度
 v0_2=u(4);%领导者纵坐标速度
 
dxi1_1=eta1_1-alpha*sig(aij_1(1,1)*(xi1_1-xi1_1)+aij_1(1,2)*(xi1_1-xi2_1)+aij_1(1,3)*(xi1_1-xi3_1)+aij_1(1,4)*(xi1_1-xi4_1)+aij_1(1,5)*(xi1_1-xi5_1)+b(1)*(xi1_1-x0_1),p/(2*q-p))-...
             beta*sig(aij_1(1,1)*(xi1_1-xi1_1)+aij_1(1,2)*(xi1_1-xi2_1)+aij_1(1,3)*(xi1_1-xi3_1)+aij_1(1,4)*(xi1_1-xi4_1)+aij_1(1,5)*(xi1_1-xi5_1)+b(1)*(xi1_1-x0_1),(2*q-p)/p);
dxi2_1=eta2_1-alpha*sig(aij_1(2,1)*(xi2_1-xi1_1)+aij_1(2,2)*(xi2_1-xi2_1)+aij_1(2,3)*(xi2_1-xi3_1)+aij_1(2,4)*(xi2_1-xi4_1)+aij_1(2,5)*(xi2_1-xi5_1)+b(2)*(xi2_1-x0_1),p/(2*q-p))-...
             beta*sig(aij_1(2,1)*(xi2_1-xi1_1)+aij_1(2,2)*(xi2_1-xi2_1)+aij_1(2,3)*(xi2_1-xi3_1)+aij_1(2,4)*(xi2_1-xi4_1)+aij_1(2,5)*(xi2_1-xi5_1)+b(2)*(xi2_1-x0_1),(2*q-p)/p);
dxi3_1=eta3_1-alpha*sig(aij_1(3,1)*(xi3_1-xi1_1)+aij_1(3,2)*(xi3_1-xi2_1)+aij_1(3,3)*(xi3_1-xi3_1)+aij_1(3,4)*(xi3_1-xi4_1)+aij_1(3,5)*(xi3_1-xi5_1)+b(3)*(xi3_1-x0_1),p/(2*q-p))-...
             beta*sig(aij_1(3,1)*(xi3_1-xi1_1)+aij_1(3,2)*(xi3_1-xi2_1)+aij_1(3,3)*(xi3_1-xi3_1)+aij_1(3,4)*(xi3_1-xi4_1)+aij_1(3,5)*(xi3_1-xi5_1)+b(3)*(xi3_1-x0_1),(2*q-p)/p);
dxi4_1=eta4_1-alpha*sig(aij_1(4,1)*(xi4_1-xi1_1)+aij_1(4,2)*(xi4_1-xi2_1)+aij_1(4,3)*(xi4_1-xi3_1)+aij_1(4,4)*(xi4_1-xi4_1)+aij_1(4,5)*(xi4_1-xi5_1)+b(4)*(xi4_1-x0_1),p/(2*q-p))-...
             beta*sig(aij_1(4,1)*(xi4_1-xi1_1)+aij_1(4,2)*(xi4_1-xi2_1)+aij_1(4,3)*(xi4_1-xi3_1)+aij_1(4,4)*(xi4_1-xi4_1)+aij_1(4,5)*(xi4_1-xi5_1)+b(4)*(xi4_1-x0_1),(2*q-p)/p);
dxi5_1=eta5_1-alpha*sig(aij_1(5,1)*(xi5_1-xi1_1)+aij_1(5,2)*(xi5_1-xi2_1)+aij_1(5,3)*(xi5_1-xi3_1)+aij_1(5,4)*(xi5_1-xi4_1)+aij_1(5,5)*(xi5_1-xi5_1)+b(5)*(xi5_1-x0_1),p/(2*q-p))-...
             beta*sig(aij_1(5,1)*(xi5_1-xi1_1)+aij_1(5,2)*(xi5_1-xi2_1)+aij_1(5,3)*(xi5_1-xi3_1)+aij_1(5,4)*(xi5_1-xi4_1)+aij_1(5,5)*(xi5_1-xi5_1)+b(5)*(xi5_1-x0_1),(2*q-p)/p);   
deta1_1=-alpha*sig(aij_1(1,1)*(eta1_1-eta1_1)+aij_1(1,2)*(eta1_1-eta2_1)+aij_1(1,3)*(eta1_1-eta3_1)+aij_1(1,4)*(eta1_1-eta4_1)+aij_1(1,5)*(eta1_1-eta5_1)+b(1)*(eta1_1-v0_1),p/(2*q-p))-...
             beta*sig(aij_1(1,1)*(eta1_1-eta1_1)+aij_1(1,2)*(eta1_1-eta2_1)+aij_1(1,3)*(eta1_1-eta3_1)+aij_1(1,4)*(eta1_1-eta4_1)+aij_1(1,5)*(eta1_1-eta5_1)+b(1)*(eta1_1-v0_1),(2*q-p)/p)-...
             lamda*sign(aij_1(1,1)*(eta1_1-eta1_1)+aij_1(1,2)*(eta1_1-eta2_1)+aij_1(1,3)*(eta1_1-eta3_1)+aij_1(1,4)*(eta1_1-eta4_1)+aij_1(1,5)*(eta1_1-eta5_1)+b(1)*(eta1_1-v0_1));
deta2_1=-alpha*sig(aij_1(2,1)*(eta2_1-eta1_1)+aij_1(2,2)*(eta2_1-eta2_1)+aij_1(2,3)*(eta2_1-eta3_1)+aij_1(2,4)*(eta2_1-eta4_1)+aij_1(2,5)*(eta2_1-eta5_1)+b(2)*(eta2_1-v0_1),p/(2*q-p))-...
             beta*sig(aij_1(2,1)*(eta2_1-eta1_1)+aij_1(2,2)*(eta2_1-eta2_1)+aij_1(2,3)*(eta2_1-eta3_1)+aij_1(2,4)*(eta2_1-eta4_1)+aij_1(2,5)*(eta2_1-eta5_1)+b(2)*(eta2_1-v0_1),(2*q-p)/p)-...;
         lamda*sign(aij_1(2,1)*(eta2_1-eta1_1)+aij_1(2,2)*(eta2_1-eta2_1)+aij_1(2,3)*(eta2_1-eta3_1)+aij_1(2,4)*(eta2_1-eta4_1)+aij_1(2,5)*(eta2_1-eta5_1)+b(2)*(eta2_1-v0_1));
deta3_1=-alpha*sig(aij_1(3,1)*(eta3_1-eta1_1)+aij_1(3,2)*(eta3_1-eta2_1)+aij_1(3,3)*(eta3_1-eta3_1)+aij_1(3,4)*(eta3_1-eta4_1)+aij_1(3,5)*(eta3_1-eta5_1)+b(3)*(eta3_1-v0_1),p/(2*q-p))-...
             beta*sig(aij_1(3,1)*(eta3_1-eta1_1)+aij_1(3,2)*(eta3_1-eta2_1)+aij_1(3,3)*(eta3_1-eta3_1)+aij_1(3,4)*(eta3_1-eta4_1)+aij_1(3,5)*(eta3_1-eta5_1)+b(3)*(eta3_1-v0_1),(2*q-p)/p)-...
             lamda*sign(aij_1(3,1)*(eta3_1-eta1_1)+aij_1(3,2)*(eta3_1-eta2_1)+aij_1(3,3)*(eta3_1-eta3_1)+aij_1(3,4)*(eta3_1-eta4_1)+aij_1(3,5)*(eta3_1-eta5_1)+b(3)*(eta3_1-v0_1));
deta4_1=-alpha*sig(aij_1(4,1)*(eta4_1-eta1_1)+aij_1(4,2)*(eta4_1-eta2_1)+aij_1(4,3)*(eta4_1-eta3_1)+aij_1(4,4)*(eta4_1-eta4_1)+aij_1(4,5)*(eta4_1-eta5_1)+b(4)*(eta4_1-v0_1),p/(2*q-p))-...
             beta*sig(aij_1(4,1)*(eta4_1-eta1_1)+aij_1(4,2)*(eta4_1-eta2_1)+aij_1(4,3)*(eta4_1-eta3_1)+aij_1(4,4)*(eta4_1-eta4_1)+aij_1(4,5)*(eta4_1-eta5_1)+b(4)*(eta4_1-v0_1),(2*q-p)/p)-...
             lamda*sign(aij_1(4,1)*(eta4_1-eta1_1)+aij_1(4,2)*(eta4_1-eta2_1)+aij_1(4,3)*(eta4_1-eta3_1)+aij_1(4,4)*(eta4_1-eta4_1)+aij_1(4,5)*(eta4_1-eta5_1)+b(4)*(eta4_1-v0_1));
deta5_1=-alpha*sig(aij_1(5,1)*(eta5_1-eta1_1)+aij_1(5,2)*(eta5_1-eta2_1)+aij_1(5,3)*(eta5_1-eta3_1)+aij_1(5,4)*(eta5_1-eta4_1)+aij_1(5,5)*(eta5_1-eta5_1)+b(5)*(eta5_1-v0_1),p/(2*q-p))-...
             beta*sig(aij_1(5,1)*(eta5_1-eta1_1)+aij_1(5,2)*(eta5_1-eta2_1)+aij_1(5,3)*(eta5_1-eta3_1)+aij_1(5,4)*(eta5_1-eta4_1)+aij_1(5,5)*(eta5_1-eta5_1)+b(5)*(eta5_1-v0_1),(2*q-p)/p)-...
             lamda*sign(aij_1(5,1)*(eta5_1-eta1_1)+aij_1(5,2)*(eta5_1-eta2_1)+aij_1(5,3)*(eta5_1-eta3_1)+aij_1(5,4)*(eta5_1-eta4_1)+aij_1(5,5)*(eta5_1-eta5_1)+b(5)*(eta5_1-v0_1));   
      
dxi1_2=eta1_2-alpha*sig(aij_2(1,1)*(xi1_2-xi1_2)+aij_2(1,2)*(xi1_2-xi2_2)+aij_2(1,3)*(xi1_2-xi3_2)+aij_2(1,4)*(xi1_2-xi4_2)+aij_2(1,5)*(xi1_2-xi5_2)+b(1)*(xi1_2-x0_2),p/(2*q-p))-...
             beta*sig(aij_2(1,1)*(xi1_2-xi1_2)+aij_2(1,2)*(xi1_2-xi2_2)+aij_2(1,3)*(xi1_2-xi3_2)+aij_2(1,4)*(xi1_2-xi4_2)+aij_2(1,5)*(xi1_2-xi5_2)+b(1)*(xi1_2-x0_2),(2*q-p)/p);
dxi2_2=eta2_2-alpha*sig(aij_2(2,1)*(xi2_2-xi1_2)+aij_2(2,2)*(xi2_2-xi2_2)+aij_2(2,3)*(xi2_2-xi3_2)+aij_2(2,4)*(xi2_2-xi4_2)+aij_2(2,5)*(xi2_2-xi5_2)+b(2)*(xi2_2-x0_2),p/(2*q-p))-...
             beta*sig(aij_2(2,1)*(xi2_2-xi1_2)+aij_2(2,2)*(xi2_2-xi2_2)+aij_2(2,3)*(xi2_2-xi3_2)+aij_2(2,4)*(xi2_2-xi4_2)+aij_2(2,5)*(xi2_2-xi5_2)+b(2)*(xi2_2-x0_2),(2*q-p)/p);
dxi3_2=eta3_2-alpha*sig(aij_2(3,1)*(xi3_2-xi1_2)+aij_2(3,2)*(xi3_2-xi2_2)+aij_2(3,3)*(xi3_2-xi3_2)+aij_2(3,4)*(xi3_2-xi4_2)+aij_2(3,5)*(xi3_2-xi5_2)+b(3)*(xi3_2-x0_2),p/(2*q-p))-...
             beta*sig(aij_2(3,1)*(xi3_2-xi1_2)+aij_2(3,2)*(xi3_2-xi2_2)+aij_2(3,3)*(xi3_2-xi3_2)+aij_2(3,4)*(xi3_2-xi4_2)+aij_2(3,5)*(xi3_2-xi5_2)+b(3)*(xi3_2-x0_2),(2*q-p)/p);
dxi4_2=eta4_2-alpha*sig(aij_2(4,1)*(xi4_2-xi1_2)+aij_2(4,2)*(xi4_2-xi2_2)+aij_2(4,3)*(xi4_2-xi3_2)+aij_2(4,4)*(xi4_2-xi4_2)+aij_2(4,5)*(xi4_2-xi5_2)+b(4)*(xi4_2-x0_2),p/(2*q-p))-...
             beta*sig(aij_2(4,1)*(xi4_2-xi1_2)+aij_2(4,2)*(xi4_2-xi2_2)+aij_2(4,3)*(xi4_2-xi3_2)+aij_2(4,4)*(xi4_2-xi4_2)+aij_2(4,5)*(xi4_2-xi5_2)+b(4)*(xi4_2-x0_2),(2*q-p)/p);
dxi5_2=eta5_2-alpha*sig(aij_2(5,1)*(xi5_2-xi1_2)+aij_2(5,2)*(xi5_2-xi2_2)+aij_2(5,3)*(xi5_2-xi3_2)+aij_2(5,4)*(xi5_2-xi4_2)+aij_2(5,5)*(xi5_2-xi5_2)+b(5)*(xi5_2-x0_2),p/(2*q-p))-...
             beta*sig(aij_2(5,1)*(xi5_2-xi1_2)+aij_2(5,2)*(xi5_2-xi2_2)+aij_2(5,3)*(xi5_2-xi3_2)+aij_2(5,4)*(xi5_2-xi4_2)+aij_2(5,5)*(xi5_2-xi5_2)+b(5)*(xi5_2-x0_2),(2*q-p)/p);        
deta1_2=-alpha*sig(aij_2(1,1)*(eta1_2-eta1_2)+aij_2(1,2)*(eta1_2-eta2_2)+aij_2(1,3)*(eta1_2-eta3_2)+aij_2(1,4)*(eta1_2-eta4_2)+aij_2(1,5)*(eta1_2-eta5_2)+b(1)*(eta1_2-v0_2),p/(2*q-p))-...
             beta*sig(aij_2(1,1)*(eta1_2-eta1_2)+aij_2(1,2)*(eta1_2-eta2_2)+aij_2(1,3)*(eta1_2-eta3_2)+aij_2(1,4)*(eta1_2-eta4_2)+aij_2(1,5)*(eta1_2-eta5_2)+b(1)*(eta1_2-v0_2),(2*q-p)/p)-...
             lamda*sign(aij_2(1,1)*(eta1_2-eta1_2)+aij_2(1,2)*(eta1_2-eta2_2)+aij_2(1,3)*(eta1_2-eta3_2)+aij_2(1,4)*(eta1_2-eta4_2)+aij_2(1,5)*(eta1_2-eta5_2)+b(1)*(eta1_2-v0_2));
deta2_2=-alpha*sig(aij_2(2,1)*(eta2_2-eta1_2)+aij_2(2,2)*(eta2_2-eta2_2)+aij_2(2,3)*(eta2_2-eta3_2)+aij_2(2,4)*(eta2_2-eta4_2)+aij_2(2,5)*(eta2_2-eta5_2)+b(2)*(eta2_2-v0_2),p/(2*q-p))-...
             beta*sig(aij_2(2,1)*(eta2_2-eta1_2)+aij_2(2,2)*(eta2_2-eta2_2)+aij_2(2,3)*(eta2_2-eta3_2)+aij_2(2,4)*(eta2_2-eta4_2)+aij_2(2,5)*(eta2_2-eta5_2)+b(2)*(eta2_2-v0_2),(2*q-p)/p)-...;
         lamda*sign(aij_2(2,1)*(eta2_2-eta1_2)+aij_2(2,2)*(eta2_2-eta2_2)+aij_2(2,3)*(eta2_2-eta3_2)+aij_2(2,4)*(eta2_2-eta4_2)+aij_2(2,5)*(eta2_2-eta5_2)+b(2)*(eta2_2-v0_2));
deta3_2=-alpha*sig(aij_2(3,1)*(eta3_2-eta1_2)+aij_2(3,2)*(eta3_2-eta2_2)+aij_2(3,3)*(eta3_2-eta3_2)+aij_2(3,4)*(eta3_2-eta4_2)+aij_2(3,5)*(eta3_2-eta5_2)+b(3)*(eta3_2-v0_2),p/(2*q-p))-...
             beta*sig(aij_2(3,1)*(eta3_2-eta1_2)+aij_2(3,2)*(eta3_2-eta2_2)+aij_2(3,3)*(eta3_2-eta3_2)+aij_2(3,4)*(eta3_2-eta4_2)+aij_2(3,5)*(eta3_2-eta5_2)+b(3)*(eta3_2-v0_2),(2*q-p)/p)-...
             lamda*sign(aij_2(3,1)*(eta3_2-eta1_2)+aij_2(3,2)*(eta3_2-eta2_2)+aij_2(3,3)*(eta3_2-eta3_2)+aij_2(3,4)*(eta3_2-eta4_2)+aij_2(3,5)*(eta3_2-eta5_2)+b(3)*(eta3_2-v0_2));
deta4_2=-alpha*sig(aij_2(4,1)*(eta4_2-eta1_2)+aij_2(4,2)*(eta4_2-eta2_2)+aij_2(4,3)*(eta4_2-eta3_2)+aij_2(4,4)*(eta4_2-eta4_2)+aij_2(4,5)*(eta4_2-eta5_2)+b(4)*(eta4_2-v0_2),p/(2*q-p))-...
             beta*sig(aij_2(4,1)*(eta4_2-eta1_2)+aij_2(4,2)*(eta4_2-eta2_2)+aij_2(4,3)*(eta4_2-eta3_2)+aij_2(4,4)*(eta4_2-eta4_2)+aij_2(4,5)*(eta4_2-eta5_2)+b(4)*(eta4_2-v0_2),(2*q-p)/p)-...
             lamda*sign(aij_2(4,1)*(eta4_2-eta1_2)+aij_2(4,2)*(eta4_2-eta2_2)+aij_2(4,3)*(eta4_2-eta3_2)+aij_2(4,4)*(eta4_2-eta4_2)+aij_2(4,5)*(eta4_2-eta5_2)+b(4)*(eta4_2-v0_2));
deta5_2=-alpha*sig(aij_2(5,1)*(eta5_2-eta1_2)+aij_2(5,2)*(eta5_2-eta2_2)+aij_2(5,3)*(eta5_2-eta3_2)+aij_2(5,4)*(eta5_2-eta4_2)+aij_2(5,5)*(eta5_2-eta5_2)+b(5)*(eta5_2-v0_2),p/(2*q-p))-...
             beta*sig(aij_2(5,1)*(eta5_2-eta1_2)+aij_2(5,2)*(eta5_2-eta2_2)+aij_2(5,3)*(eta5_2-eta3_2)+aij_2(5,4)*(eta5_2-eta4_2)+aij_2(5,5)*(eta5_2-eta5_2)+b(5)*(eta5_2-v0_2),(2*q-p)/p)-...
             lamda*sign(aij_2(5,1)*(eta5_2-eta1_2)+aij_2(5,2)*(eta5_2-eta2_2)+aij_2(5,3)*(eta5_2-eta3_2)+aij_2(5,4)*(eta5_2-eta4_2)+aij_2(5,5)*(eta5_2-eta5_2)+b(5)*(eta5_2-v0_2));   
 
sys(1)=dxi1_1;
sys(2)=dxi2_1;
sys(3)=dxi3_1;
sys(4)=dxi4_1;
sys(5)=dxi5_1;

sys(1+5)=dxi1_2;
sys(2+5)=dxi2_2;
sys(3+5)=dxi3_2;
sys(4+5)=dxi4_2;
sys(5+5)=dxi5_2;

sys(1+10)=deta1_1;
sys(2+10)=deta2_1;
sys(3+10)=deta3_1;
sys(4+10)=deta4_1;
sys(5+10)=deta5_1;

sys(6+10)=deta1_2;
sys(7+10)=deta2_2;
sys(8+10)=deta3_2;
sys(9+10)=deta4_2;
sys(10+10)=deta5_2;



function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
sys(5)=x(5);

sys(1+5)=x(1+5);
sys(2+5)=x(2+5);
sys(3+5)=x(3+5);
sys(4+5)=x(4+5);
sys(5+5)=x(5+5);

sys(1+10)=x(1+10);
sys(2+10)=x(2+10);
sys(3+10)=x(3+10);
sys(4+10)=x(4+10);
sys(5+10)=x(5+10);

sys(1+5+10)=x(1+5+10);
sys(2+5+10)=x(2+5+10);
sys(3+5+10)=x(3+5+10);
sys(4+5+10)=x(4+5+10);
sys(5+5+10)=x(5+5+10);







