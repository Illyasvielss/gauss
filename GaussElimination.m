% Gauss消元法的Matlab实现%原文链接：https://blog.csdn.net/lol_IP/article/details/78451695
function [r_matrix] = GaussElimination(Coefficient_matrix,Load_matrix)
%  inputs:
%         Coefficient_matrix:系数矩阵，为n*n维方阵
%         Load_matrix       :载荷矩阵，为n*1维矩阵
%  outputs：
%         r_matrix:计算结果向量,为n*1为矩阵

% 判断输入矩阵维度是否满足要求
[row_coeff,col_coeff] = size(Coefficient_matrix);
[row_load,~] = size(Load_matrix');

% 初始化r_matrix矩阵
r_matrix = zeros(row_load,1);
% 判断输入的维度是否满足要求
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % 不满足则输出错误提示
    print('输入错误！');
else
    % 满足则进行下一步运算
    for k = 1:row_coeff-1
        % 检查主对角元素第i行的第i个元素是否为0
        if Coefficient_matrix(k,k) == 0
            print('主对角元素错误！');
        else
            % 循环计算第k+1行到最后一行
            for i = k+1:row_coeff
               L_ik = Coefficient_matrix(i,k) / Coefficient_matrix(k,k); %更新L_ik
               % 更新每一行从第i个元素开始后的所有元素
               for j = k+1:col_coeff
                   Coefficient_matrix(i,j) = Coefficient_matrix(i,j) - ...
                       L_ik*Coefficient_matrix(k,j); % 更新a(i,j)
                    %disp(i);
                   % disp(j);
                    disp( Coefficient_matrix(i,j) );
                  %  fprintf('i=%d',i,'j=%d\n',j,...
                     %   'Coefficient_matrix(i,j) %3.0f\n',  Coefficient_matrix(i,j)); 
               end
               Load_matrix(i) = Load_matrix(i) - Load_matrix(k)*L_ik; % 更新b(i)
               disp(Load_matrix(i));
               Coefficient_matrix(i,1) = 0; 
            end %for循环结束
        end % 条件2结束
    end % for循环结束
    % 回代过程
    r_matrix(row_coeff) = Load_matrix(row_coeff)/Coefficient_matrix(row_coeff,col_coeff);
    for k = row_coeff-1:-1:1
        sum_temp = 0;
        for j = k+1:col_coeff
            sum_temp = sum_temp + Coefficient_matrix(k,j)*r_matrix(j);
        end
        r_matrix(k) = (Load_matrix(k) - sum_temp)/Coefficient_matrix(k,k);
    end
end % 条件判断结束
end % 函数结束

