
% figure(1);
% % plot(t,y(:,1),'k',t,y(:,2),'b',t,y(:,3),'r:',t,y(:,4),'g--','linewidth',1.5);
% plot(t,y1(:,1),t,y2(:,[1 2 3 4 5 6]))
% legend('$x_0$','$\theta_1$','$\theta_2$','$\theta_3$','$\theta_4$','$\theta_5$','$\theta_6$','interpreter','latex','linewidth',1.5,'fontsize',15);
% xlabel('time(s)');ylabel('position states of leader and its estimation of position states');
% 
% figure(2)
% plot(t,y1(:,2),t,y2(:,[7 8 9 10 11 12]),'linewidth',1.5)
% xlabel('time(s)');ylabel('velocity states of leader and its estimation of velocity states');
% legend('$v_0$','$\omega _1$','$\omega_2$','$\omega_3$','$\omega _4$','$\omega_5$','$\omega_6$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% figure(3);
% plot(t,y2(:,[1 2 3 4 5 6])-y1(:,1))%位置估计跟踪误差
% xlabel('time(s)');
% ylabel('the position estimation error $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\epsilon_{p1}$','$\epsilon_{p2}$','$\epsilon_{p3}$','$\epsilon_{p4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
%  
% figure(4);
% plot(t,y2(:,[7 8 9 10 11 12])-y1(:,2))%速度估计跟踪误差
% xlabel('time(s)');
% ylabel('the velocity estimation error $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\epsilon_{v1}$','$\epsilon_{v2}$','$\epsilon_{v3}$','$\epsilon_{v4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
% figure(5)
% plot(t,y4(:,[1 2 3 4]))%一阶智能体位置误差
% xlabel('time(s)');
% ylabel('the position estimation error of first order agents $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\xi_{p1}$','$\xi_{p2}$','$\xi_{p3}$','$\xi_{p4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
% figure(6)%二阶智能体位置误差
% plot(t,y3(:,[1 2]))
% xlabel('time(s)');
% ylabel('the position estimation error of second order agents $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\zeta_{p1}$','$\zeta_{p2}$','interpreter','latex','linewidth',1.5,'fontsize',15);

figure(1)
plot(t,y11(:,1:5),t,y8(:,1),'b--')

figure(2)
plot(t,y11(:,6:10),t,y8(:,2),'b--')

figure(3)
plot(t,y11(:,11:15),t,y8(:,3),'b--')

figure(4)
plot(t,y11(:,16:20),t,y8(:,4),'b--')

figure(5)
plot(t,y9(:,1:5))









