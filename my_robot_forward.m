% ������ǰ�˶�ѧ
clear variables; close all; clc;
% theta1= 0; theta2 = 0; theta3 = 0; 
syms theta1 theta2 theta3 a2 d4
theta4 = 0;%ֻ����ǰ�����ؽڵ��˶�
% a2 = 1.300; d4 = 1.400 + 0.32545;%(����������ĳ��ȣ�

T01 = Chuandi_matrix(0, 0, 0, theta1);
T12 = Chuandi_matrix(pi/2, 0, 0, theta2+pi/2);
T23 = Chuandi_matrix(0, a2, 0, theta3);
T34 = Chuandi_matrix(pi/2, 0, d4, theta4);

T04 = T01*T12*T23*T34;

