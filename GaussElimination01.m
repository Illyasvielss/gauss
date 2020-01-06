function aa= GaussElimination01(Coefficient_matrix,Load_matrix)
%  inputs:
%         Coefficient_matrix:系数矩阵，为n*n维方阵
%         Load_matrix       :载荷矩阵，为n*1维矩阵
%  outputs：aa

[row_coeff,col_coeff] = size(Coefficient_matrix);
% 初始化一个消元后的矩阵（它将是三角矩阵）
a=triu( ones(col_coeff));
aa=[a Load_matrix'];
disp(aa);
for i = 1:col_coeff
    aa(1,i)=Coefficient_matrix(1,i);
end  
aa(1,col_coeff+1) =Load_matrix(1);
disp('initializing aa');
disp(aa);
stop=0; 
for k = 1:row_coeff-1
            % 循环计算第k+1行到最后一行
            for i = k+1:row_coeff %for2
               L_ik = Coefficient_matrix(i,k) / Coefficient_matrix(k,k); %更新L_ik
               % 更新每一行从第i个元素开始后的所有元素
                    for j = k+1:row_coeff %for1
                        Coefficient_matrix(i,j) = Coefficient_matrix(i,j) - ...
                        L_ik*Coefficient_matrix(k,j); % 更新a(i,j)              
                        %disp( 'Coefficient_matrix(i,j) ');
                       % disp( Coefficient_matrix(i,j) );
                        if ( j<col_coeff+1 &&stop==0)
                            aa(i,j)=Coefficient_matrix(i,j) ;
                            %fprintf('stop=%d\n',stop);
                        else
                            stop=1;
                            %fprintf('stop=%d\n',stop);
                         end %endif
                     %disp(aa);每一位的变化
                     end %endfor1
               stop=0;
               Load_matrix(i) = Load_matrix(i) - Load_matrix(k)*L_ik; % 更新b(i)
               %disp(Load_matrix(i));
                aa(i,j+1)=Load_matrix(i) ;
                disp(aa);
              %  fprintf('stop=%d\n',stop);
                Coefficient_matrix(i,1) = 0;   
            end %for2循环结束  
        disp('sss');
        aa(i,col_coeff-1)=0;
end % for循环结束



