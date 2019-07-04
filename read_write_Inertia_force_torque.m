% ���룺 �����ؽ���ʱ��仯�ĽǶ�ֵ�����ٶ�ֵ�ͽǼ��ٶ�ֵ
% ����� �����˼��Ĺ������͹�������
% ������ ţ��ŷ������

%��һ���� ���ݶ���

clear variables; close all; clc;
%��ȡexcel����

% 
% %��ֱƽ��x1_0�ڵ�ˮƽֱ��
% str_lujing_inverse = 'D:\fk_file_important\MATLAB_CODE\bigua_shuiping_inverse_x1_0.xlsx';
% str_lujing_force   = 'D:\fk_file_important\MATLAB_CODE\force_bigua_shuiping_x1_0.xlsx';
% str_lujing_torque  = 'D:\fk_file_important\MATLAB_CODE\torque_bigua_shuiping_x1_0.xlsx';

%%��ֱƽ��x1_0�ڵĴ�ֱֱ��
str_lujing_inverse = 'D:\fk_file_important\MATLAB_CODE\bigua_chuizhi_inverse_x1_0.xlsx';
str_lujing_force   = 'D:\fk_file_important\MATLAB_CODE\force_bigua_chuizhi_x1_0.xlsx';
str_lujing_torque  = 'D:\fk_file_important\MATLAB_CODE\torque_bigua_chuizhi_x1_0.xlsx';


% %ˮƽƽ��y1_4�ڵ�ˮƽֱ��
% str_lujing_inverse = 'D:\fk_file_important\MATLAB_CODE\bigua_shuiping_inverse_y1_4.xlsx';
% str_lujing_force   = 'D:\fk_file_important\MATLAB_CODE\force_bigua_shuiping_y1_4.xlsx';
% str_lujing_torque  = 'D:\fk_file_important\MATLAB_CODE\torque_bigua_shuiping_y1_4.xlsx';



% % %ˮƽƽ��y1_4�ڵĴ�ֱֱ��
% str_lujing_inverse = 'D:\fk_file_important\MATLAB_CODE\bigua_chuizhi_inverse_y1_4.xlsx';
% str_lujing_force   = 'D:\fk_file_important\MATLAB_CODE\force_bigua_chuizhi_y1_4.xlsx';
% str_lujing_torque  = 'D:\fk_file_important\MATLAB_CODE\torque_bigua_chuizhi_y1_4.xlsx';



% str_temp_1  = 'D:\fk_file_important\MATLAB_CODE\temp_1.xlsx';
% str_temp_2  = 'D:\fk_file_important\MATLAB_CODE\temp_2.xlsx';

read_t = xlsread(str_lujing_inverse,'sheet1','A1:A14600');
read_q = xlsread(str_lujing_inverse,'sheet1','B1:D14600');

read_dq_1 = gradient(read_q(:,1)) ./ gradient(read_t);
read_dq_2 = gradient(read_q(:,2)) ./ gradient(read_t);  
read_dq_3 = gradient(read_q(:,3)) ./ gradient(read_t);

read_ddq_1 = gradient(read_dq_1) ./ gradient(read_t);
read_ddq_2 = gradient(read_dq_2) ./ gradient(read_t);
read_ddq_3 = gradient(read_dq_3) ./ gradient(read_t);

max_ddq_1 = 1000*pi/180;              %�Ը����ؽڵĽǼ��ٶȽ������ƣ���ʵ�ʻ����˵�����Ϊ�ο�
max_ddq_2 = 1000*pi/180;
max_ddq_3 = 1000*pi/180;
num_ddq = size(read_ddq_1,1);

for num_ddq_i = 1:1:num_ddq
    if read_ddq_1(num_ddq_i) > max_ddq_1
        read_ddq_1(num_ddq_i) = max_ddq_1;
    end
    if read_ddq_1(num_ddq_i) < -max_ddq_1
        read_ddq_1(num_ddq_i) = -max_ddq_1;
    end
    
    if read_ddq_2(num_ddq_i) > max_ddq_2
        read_ddq_2(num_ddq_i) = max_ddq_2;
    end
    if read_ddq_2(num_ddq_i) < -max_ddq_2
        read_ddq_2(num_ddq_i) = -max_ddq_2;
    end
    
    if read_ddq_3(num_ddq_i) > max_ddq_3
        read_ddq_3(num_ddq_i) = max_ddq_3;
    end
    if read_ddq_3(num_ddq_i) < -max_ddq_3
        read_ddq_3(num_ddq_i) = -max_ddq_3;
    end
end
        
    
    

% k = ' ';
% xlswrite(str_temp_1,  k,'A1:Z30000')%��ձ���е�����
% xlswrite(str_temp_1, [read_t read_dq_1], 'sheet1', 'A1:E30000');
% xlswrite(str_temp_1, [read_t read_dq_2], 'sheet1', 'G1:K30000');
% xlswrite(str_temp_1, [read_t read_dq_3], 'sheet1', 'M1:Q30000');
% 
% xlswrite(str_temp_2,  k,'A1:Z30000')%��ձ���е�����
% xlswrite(str_temp_2, [read_t read_ddq_1], 'sheet1', 'A1:E30000');
% xlswrite(str_temp_2, [read_t read_ddq_2], 'sheet1', 'G1:K30000');
% xlswrite(str_temp_2, [read_t read_ddq_3], 'sheet1', 'M1:Q30000');
% 
% %Ϊ�˿��Լ�����õ��Ľ��ٶȺ�adams������Ľ��ٶȵ����� �ڴ˻������ٶȺͽǽ��ٶȵ�����


figure(223343)         
plot(read_t, read_q(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, read_q(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, read_q(:,3),'r-.','LineWidth',3);  
hold on  
title('angle of robot','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('angle of robot','FontSize',20);
legend_set = legend('angle of yaobu','angle of dabi','angle of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;



figure(223344)           %��ʾ��Ϻ��Ч��������������
plot(read_t, read_dq_1,'k-','LineWidth',3);            
hold on
plot(read_t, read_dq_2,'b:','LineWidth',3);      
hold on
plot(read_t, read_dq_3,'r-.','LineWidth',3);  
hold on  
title('angle velcolity of robot','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('angle velcolity of robot','FontSize',20);
legend_set = legend('angle velcolity of yaobu','angle velcolity of dabi','angle velcolity of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;

figure(223345) 
plot(read_t, read_ddq_1,'b-','LineWidth',3);            
hold on
plot(read_t, read_ddq_2,'r:','LineWidth',3);      
hold on
plot(read_t, read_ddq_3,'k-.','LineWidth',3);  
hold on  
title('angle acceleration velcolity of robot','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('angle acceleration velcolity of robot','FontSize',20);
legend_set = legend('angle acceleration velcolity of yaobu','angle acceleration velcolity of dabi','angle acceleration velcolity of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;








%�ڶ���������
for num = 1:1:size(read_q, 1)
    theta = read_q(num,:);  
    dtheta = [read_dq_1(num,:) read_dq_2(num,:) read_dq_3(num,:)];
    ddtheta = [read_ddq_1(num,:) read_ddq_2(num,:) read_ddq_3(num,:)];
    
    [F_inertia, Torqu_inertia] = Compute_Inertia_force(theta, dtheta, ddtheta);
    
    
    %������ͨ����������ļ���õ������˼����ĵĹ������͹������أ�����ڻ����̶�����ϵ����ʵ�ʵĻ����������������ϵ��ת��һ���ĽǶȣ�Ϊ��
    %ʹ��abaqus�������ص���ȷ�����õ����������ؽ�����Ӧ�ķ���ת��
    F_inertia(:,1) = ROT_x(F_inertia(:,1), -pi/18);
    F_inertia(:,2) = ROT_x(F_inertia(:,2), -pi/18);
    F_inertia(:,3) = ROT_x(F_inertia(:,3), -pi/18);
    Torqu_inertia(:,1) = ROT_x(Torqu_inertia(:,1), -pi/18);
    Torqu_inertia(:,2) = ROT_x(Torqu_inertia(:,2), -pi/18);
    Torqu_inertia(:,3) = ROT_x(Torqu_inertia(:,3), -pi/18);
    
    
    F0_1(num,:) = F_inertia(:,1)';
    F0_2(num,:) = F_inertia(:,2)';
    F0_3(num,:) = F_inertia(:,3)';
    
    N_torque_0_1(num,:) = Torqu_inertia(:,1)';
    N_torque_0_2(num,:) = Torqu_inertia(:,2)';
    N_torque_0_3(num,:) = Torqu_inertia(:,3)';
end


F0_1_total = sqrt((F0_1(:,1)).^2 + (F0_1(:,2)).^2 + (F0_1(:,3)).^2);
F0_2_total = sqrt((F0_2(:,1)).^2 + (F0_2(:,2)).^2 + (F0_2(:,3)).^2);
F0_3_total = sqrt((F0_3(:,1)).^2 + (F0_3(:,2)).^2 + (F0_3(:,3)).^2);

N_torque_0_1_total = sqrt((N_torque_0_1(:,1)).^2 + (N_torque_0_1(:,2)).^2 + (N_torque_0_1(:,3)).^2);
N_torque_0_2_total = sqrt((N_torque_0_2(:,1)).^2 + (N_torque_0_2(:,2)).^2 + (N_torque_0_2(:,3)).^2);
N_torque_0_3_total = sqrt((N_torque_0_3(:,1)).^2 + (N_torque_0_3(:,2)).^2 + (N_torque_0_3(:,3)).^2);

size(read_t)
size(F0_1(:,1))



% ����������ͼ
figure(1)
plot(read_t, F0_1(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, F0_1(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, F0_1(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia force of yaobu','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force of yaobu(newton)','FontSize',20);
legend_set = legend('X-direction Inertia force of yaobu','Y-direction Inertia force of yaobu','Z-direction Inertia force of yaobu');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;

figure(2)
plot(read_t, N_torque_0_1(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, N_torque_0_1(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, N_torque_0_1(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia  Torque of yaobu','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia  Torque of yaobu(newton-millimeter)','FontSize',20);
legend_set = legend('X-direction Inertia  Torque of yaobu','Y-direction Inertia  Torque of yaobu','Z-direction Inertia  Torque of yaobu');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;



figure(3)
plot(read_t, F0_2(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, F0_2(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, F0_2(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia force of dabi','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force of dabi(newton)','FontSize',20);
legend_set = legend('X-direction Inertia force of dabi','Y-direction Inertia force of dabi','Z-direction Inertia force of dabi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;

figure(4)
plot(read_t, N_torque_0_2(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, N_torque_0_2(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, N_torque_0_2(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia Torque of dabi','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia Torque of dabi(newton-millimeter)','FontSize',20);
legend_set = legend('X-direction Inertia Torque of dabi','Y-direction Inertia Torque of dabi','Z-direction Inertia Torque of dabi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;

figure(5)
plot(read_t, F0_3(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, F0_3(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, F0_3(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia force of xiaobi','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force of xiaobi(newton)','FontSize',20);
legend_set = legend('X -direction Inertia force of xiaobi');
legend_set = legend('X-direction Inertia force of xiaobi','Y-direction Inertia force of xiaobi','Z-direction Inertia force of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;

figure(6)
plot(read_t, N_torque_0_3(:,1),'k-','LineWidth',3);            
hold on
plot(read_t, N_torque_0_3(:,2),'b:','LineWidth',3);      
hold on
plot(read_t, N_torque_0_3(:,3),'r-.','LineWidth',3);  
hold on  
title('Inertia Torque of xiaobi','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia Torque of xiaobi(newton-millimeter)','FontSize',20);
legend_set = legend('X-direction Inertia Torque of xiaobi','Y-direction Inertia Torque of xiaobi','Z-direction Inertia Torque of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',15);     %����legend�����С
grid on;
hold off;


figure(7)
plot(read_t, F0_1_total,'k-','LineWidth',3);            
hold on
plot(read_t, F0_2_total,'b:','LineWidth',3);      
hold on
plot(read_t, F0_3_total,'r-.','LineWidth',3);  
hold on  
title('Inertia force of robot','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia force of robot(newton)','FontSize',20);
legend_set = legend('Inertia force of yaobu','Inertia force of dabi','Inertia force of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',20);     %����legend�����С
grid on;
hold off;


figure(8)
plot(read_t, N_torque_0_1_total,'k-','LineWidth',3);            
hold on
plot(read_t, N_torque_0_2_total,'b:','LineWidth',3);      
hold on
plot(read_t, N_torque_0_3_total,'r-.','LineWidth',3);  
hold on  
title('Inertia Torque of robot','FontSize',20);
xlabel('t(s)','FontSize',20); ylabel('Inertia Torque of robot(newton-millimeter)','FontSize',20);
legend_set = legend('Inertia Torque of yaobu','Inertia Torque of dabi','Inertia Torque of xiaobi');
set(legend_set,'Fontname', 'Times New Roman','FontSize',20);     %����legend�����С
grid on;
hold off;


%���Ĳ������������͹������ص�����д�뵽excel�����
k = ' ';
% xlswrite(str_lujing_force, k,'A1:Q30000')%��ձ���е�����
xlswrite(str_lujing_force, [read_t F0_1 F0_1_total], 'sheet1', 'A1:E4000');
xlswrite(str_lujing_force, [read_t F0_2 F0_2_total], 'sheet1', 'G1:K4000');
xlswrite(str_lujing_force, [read_t F0_3 F0_3_total], 'sheet1', 'M1:Q4000');



xlswrite(str_lujing_torque,  k,'A1:Q3000')%��ձ���е�����
xlswrite(str_lujing_torque, [read_t N_torque_0_1 N_torque_0_1_total], 'sheet1', 'A1:E4000');
xlswrite(str_lujing_torque, [read_t N_torque_0_2 N_torque_0_2_total], 'sheet1', 'G1:K4000');
xlswrite(str_lujing_torque, [read_t N_torque_0_3 N_torque_0_3_total], 'sheet1', 'M1:Q4000');



