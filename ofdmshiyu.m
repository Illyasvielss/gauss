% subcarrier_time_domain.m
% ����OFDM��Nc�����ز���ʱ���ϵĲ���
% �ο����ϣ�4G: LTE/LTE-Advanced for Mobile Broadband Second Edition �C \
% ��CHAPTER 3 OFDM Transmission��,���e^(j * 2 * pi (k / T)t )��Ӧ��ʱ�򲿷�
% ����޸�ʱ��2016.07.30
clear
 
Tu = 2 * pi;    % OFDM����
st = 0.0;       % OFDM���ſ�ʼʱ��
sp = 0.01;      % ��OFDM�Ŀ�ʼʱ�䵽����ʱ��Ĳ���
ed = Tu + st;   % OFDM���ŵĽ���ʱ��
 
t = st : sp : ed; % x��
 
fn = 0;
fn = fn + 1;
figure(fn);
plot(t, cos(0 * t), t, cos(1 * t), t, cos(2 * t), t, cos(3 * t)); % ���ز�Nc = 4
grid on;
xlabel('t');ylabel('A');
title(['N_c = 4, T_u= ', num2str(Tu)]);