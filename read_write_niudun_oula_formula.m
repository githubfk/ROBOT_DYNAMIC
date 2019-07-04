% 输入： 各个关节随时间变化的角度值、角速度值和角加速度值
% 输出： 各个关节的驱动力矩
% 方法： 牛顿欧拉方程

%第一步： 数据读入

clear variables; close all; clc;
%读取excel数据
read_t = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_inverse_y1_4.xlsx','sheet1','A1:A14600');

read_q = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_inverse_y1_4.xlsx','sheet1','B1:D14600');




read_t_ADAMS  = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_y1_4_torque_from_adams.xlsx','sheet1','A3:A20030');
read_torque_1_ADAMS = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_y1_4_torque_from_adams.xlsx','sheet1','B3:B20030');
read_torque_2_ADAMS = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_y1_4_torque_from_adams.xlsx','sheet1','C3:C20030');
read_torque_3_ADAMS = xlsread('D:\fk_file_important\MATLAB_CODE\bigua_shuiping_y1_4_torque_from_adams.xlsx','sheet1','D3:D20030');


read_dq_1 = gradient(read_q(:,1))./gradient(read_t);
read_dq_2 = gradient(read_q(:,2))./gradient(read_t);
read_dq_3 = gradient(read_q(:,3))./gradient(read_t);


read_ddq_1 = gradient(read_dq_1)./gradient(read_t);
read_ddq_2 = gradient(read_dq_2)./gradient(read_t);
read_ddq_3 = gradient(read_dq_3)./gradient(read_t);



for num = 1:size(read_ddq_1,1)
    theta = read_q(num,:);  
    dtheta = [read_dq_1(num,:) read_dq_2(num,:) read_dq_3(num,:)];
    ddtheta = [read_ddq_1(num,:) read_ddq_2(num,:) read_ddq_3(num,:)];
    Ti(num,:) = niudun_oula_formula(theta, dtheta, ddtheta);
end

Torque_Joint_1 = Ti(:,1);
Torque_Joint_2 = Ti(:,2);
Torque_Joint_3 = Ti(:,3);


figure(13);
% plot(read_t, Torque_Joint_1,'k-','LineWidth',3);            
% hold on
% % plot(read_t, Torque_Joint_2,'b-','LineWidth',3);      
% % hold on
plot(read_t, Torque_Joint_3,'r-','LineWidth',3);  
hold on  


% plot(read_t_ADAMS(1:1:end), read_torque_1_ADAMS(1:1:end),'b*')
% hold on
% plot(read_t_ADAMS(1:6:end), read_torque_2_ADAMS(1:6:end),'r*')
% hold on
plot(read_t_ADAMS(1:6:end), read_torque_3_ADAMS(1:6:end),'k*')
hold on

title('Torque of Joint (considering gravity)','FontSize',15);
xlabel('t(s)','FontSize',20); ylabel('Torque of Joint(newton-meter)','FontSize',20);
legend_set = legend('Torque of Joint of 1','Torque of Joint of 2','Torque of Joint of 3','Torque of Joint of 1 from Adams','Torque of Joint of 2 from Adams','Torque of Joint of 3 from Adams');
set(legend_set,'Fontname', 'Times New Roman','FontSize',20);     %设置legend字体大小
grid on;
hold off;

