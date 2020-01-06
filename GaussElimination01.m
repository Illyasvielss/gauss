% Gauss消元法的Matlab实现%原文链接：https://blog.csdn.net/lol_IP/article/details/78451695
function aa= GaussElimination01(Coefficient_matrix,Load_matrix)
%  inputs:
%         Coefficient_matrix:系数矩阵，为n*n维方阵
%         Load_matrix       :载荷矩阵，为n*1维矩阵
%  outputs：
%         r_matrix:计算结果向量,为n*1为矩阵

% 判断输入矩阵维度是否满足要求
[row_coeff,col_coeff] = size(Coefficient_matrix);

% 初始化r_matrix矩阵,定义一个消元后的矩阵（它将是三角矩阵）
aa=triu( ones(col_coeff+1));
for i = 1:col_coeff
    aa(1,i)=Coefficient_matrix(1,i);
end  
aa(1,col_coeff+1) =Load_matrix(1);
for i = col_coeff+1:row_coeff
    for j = 1:col_coeff
    aa(i,j)=0;
    end 
    aa(1,col_coeff+1) =Load_matrix(1);
end 
disp('initializing aa');
disp(aa);
    % 满足则进行下一步运算
stop=0;  
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
                    disp( 'Coefficient_matrix(i,j) ');
                    disp( Coefficient_matrix(i,j) );
                    if ( j<col_coeff+1 &&stop==0)
                        aa(i,j)=Coefficient_matrix(i,j) ;
                        fprintf('stop=%d\n',stop);
                    else
                        stop=1;
                        fprintf('stop=%d\n',stop);
                    end
                     disp(aa);
               end
               stop=0;
               Load_matrix(i) = Load_matrix(i) - Load_matrix(k)*L_ik; % 更新b(i)
               disp(Load_matrix(i));
                aa(i,j+1)=Load_matrix(i) ;
                disp(aa);
              %  fprintf('stop=%d\n',stop);
               Coefficient_matrix(i,1) = 0;   
            end %for循环结束
        end % 条件2结束
        disp('sss');
        disp(i);
        disp(col_coeff-1);
        aa(i-1,col_coeff-1)=0;
        disp(aa);
end % for循环结束
    % 回代过程



