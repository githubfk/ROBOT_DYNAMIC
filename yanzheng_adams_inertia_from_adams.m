clear variables; close all; clc;
%��ȡexcel����
read_t = xlsread('D:\fk_file_important\MATLAB_CODE\cm_acceleration.xlsx','sheet1','A3:A14600');

read_q = xlsread('D:\fk_file_important\MATLAB_CODE\cm_acceleration.xlsx','sheet1','B3:D14600');

cm_acceleration_yaobu  = read_q(:,1);
cm_acceleration_dabi   = read_q(:,2);
cm_acceleration_xiaobi = read_q(:,3);

inertia_force_yaobu_from_adams  = cm_acceleration_yaobu  .*  257.27572822;
inertia_force_dabi_from_adams   = cm_acceleration_dabi   .*  78.58091036;
inertia_force_xiaobi_from_adams = cm_acceleration_xiaobi .*  82.07360471;

figure(1)         
% plot(read_t, inertia_force_yaobu_from_adams,'k-','LineWidth',3);            
% hold on
plot(read_t, inertia_force_dabi_from_adams,'b:','LineWidth',3);      
hold on
% plot(read_t, inertia_force_xiaobi_from_adams,'r-.','LineWidth',3);  
% hold on  
title('Inertia force','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force(newton)','FontSize',20);
legend_set = legend('Inertia force of yaobu','Inertia force of dabi','Inertia force of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold on;

read_t_matlab = xlsread('D:\fk_file_important\MATLAB_CODE\zhixian_circle_shuiping_force.xlsx','sheet1','A1:A14600');
read_force_yaobu_matlab  = xlsread('D:\fk_file_important\MATLAB_CODE\zhixian_circle_shuiping_force.xlsx','sheet1','E1:E14600');
read_force_dabi_matlab   = xlsread('D:\fk_file_important\MATLAB_CODE\zhixian_circle_shuiping_force.xlsx','sheet1','K1:K14600');
read_force_xiaobi_matlab = xlsread('D:\fk_file_important\MATLAB_CODE\zhixian_circle_shuiping_force.xlsx','sheet1','Q1:Q14600');

% 
% plot(read_t_matlab, read_force_yaobu_matlab,'r*','LineWidth',3);            
% hold on
% plot(read_t_matlab, read_force_dabi_matlab,'b*','LineWidth',3);      
% hold on
plot(read_t_matlab, read_force_xiaobi_matlab,'r*','LineWidth',3);   %       �ڴ˷����������߲����غϣ�����ԭ����matlab������ĸ˼����������adams�����Ĳ�һ��������������matlab������������ͼ������Լ�����ܵ����ģ�
%����adams��Ϊ�˷��㣬ֻ�ǵ������������ĵļ��ٶȡ�
hold on  
title('Inertia force','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force(newton)','FontSize',20);
legend_set = legend('Inertia force of yaobu','Inertia force of dabi','Inertia force of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold on;
