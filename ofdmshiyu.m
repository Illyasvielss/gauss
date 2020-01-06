% subcarrier_time_domain.m
% 绘制OFDM的Nc个子载波在时域上的波形
% 参考资料：4G: LTE/LTE-Advanced for Mobile Broadband Second Edition – \
% “CHAPTER 3 OFDM Transmission”,理解e^(j * 2 * pi (k / T)t )对应的时域部分
% 最后修改时间2016.07.30
clear
 
Tu = 2 * pi;    % OFDM周期
st = 0.0;       % OFDM符号开始时间
sp = 0.01;      % 从OFDM的开始时间到结束时间的步长
ed = Tu + st;   % OFDM符号的结束时间
 
t = st : sp : ed; % x轴
 
fn = 0;
fn = fn + 1;
figure(fn);
plot(t, cos(0 * t), t, cos(1 * t), t, cos(2 * t), t, cos(3 * t)); % 子载波Nc = 4
grid on;
xlabel('t');ylabel('A');
title(['N_c = 4, T_u= ', num2str(Tu)]);