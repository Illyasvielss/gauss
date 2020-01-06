% Gauss��Ԫ����Matlabʵ��%ԭ�����ӣ�https://blog.csdn.net/lol_IP/article/details/78451695
function [r_matrix] = GaussElimination(Coefficient_matrix,Load_matrix)
%  inputs:
%         Coefficient_matrix:ϵ������Ϊn*nά����
%         Load_matrix       :�غɾ���Ϊn*1ά����
%  outputs��
%         r_matrix:����������,Ϊn*1Ϊ����

% �ж��������ά���Ƿ�����Ҫ��
[row_coeff,col_coeff] = size(Coefficient_matrix);
[row_load,~] = size(Load_matrix');

% ��ʼ��r_matrix����
r_matrix = zeros(row_load,1);
% �ж������ά���Ƿ�����Ҫ��
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % �����������������ʾ
    print('�������');
else
    % �����������һ������
    for k = 1:row_coeff-1
        % ������Խ�Ԫ�ص�i�еĵ�i��Ԫ���Ƿ�Ϊ0
        if Coefficient_matrix(k,k) == 0
            print('���Խ�Ԫ�ش���');
        else
            % ѭ�������k+1�е����һ��
            for i = k+1:row_coeff
               L_ik = Coefficient_matrix(i,k) / Coefficient_matrix(k,k); %����L_ik
               % ����ÿһ�дӵ�i��Ԫ�ؿ�ʼ�������Ԫ��
               for j = k+1:col_coeff
                   Coefficient_matrix(i,j) = Coefficient_matrix(i,j) - ...
                       L_ik*Coefficient_matrix(k,j); % ����a(i,j)
                    %disp(i);
                   % disp(j);
                    disp( Coefficient_matrix(i,j) );
                  %  fprintf('i=%d',i,'j=%d\n',j,...
                     %   'Coefficient_matrix(i,j) %3.0f\n',  Coefficient_matrix(i,j)); 
               end
               Load_matrix(i) = Load_matrix(i) - Load_matrix(k)*L_ik; % ����b(i)
               disp(Load_matrix(i));
               Coefficient_matrix(i,1) = 0; 
            end %forѭ������
        end % ����2����
    end % forѭ������
    % �ش�����
    r_matrix(row_coeff) = Load_matrix(row_coeff)/Coefficient_matrix(row_coeff,col_coeff);
    for k = row_coeff-1:-1:1
        sum_temp = 0;
        for j = k+1:col_coeff
            sum_temp = sum_temp + Coefficient_matrix(k,j)*r_matrix(j);
        end
        r_matrix(k) = (Load_matrix(k) - sum_temp)/Coefficient_matrix(k,k);
    end
end % �����жϽ���
end % ��������

