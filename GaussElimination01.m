function yy= GaussElimination01(Coefficient_matrix,Load_matrix)
%  inputs:
%         Coefficient_matrix:ϵ������Ϊn*nά����
%         Load_matrix       :�غɾ���Ϊn*1ά����
%  outputs��aa

[row_coeff,col_coeff] = size(Coefficient_matrix);
% ��ʼ��һ����Ԫ��ľ������������Ǿ���
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
k=0;yi=0;
breakkey=1;
while( k<row_coeff)
for k = 1:row_coeff-1
     % ������Խ�Ԫ�ص�i�еĵ�i��Ԫ���Ƿ�Ϊ0
        if Coefficient_matrix(k,k) == 0
            print('���Խ�Ԫ�ش���');
        else
            % ѭ�������k+1�е����һ��
            for i = k+1:row_coeff %for2
               L_ik = Coefficient_matrix(i,k) / Coefficient_matrix(k,k); %����L_ik
               % ����ÿһ�дӵ�i��Ԫ�ؿ�ʼ�������Ԫ��
                    for j = k+1:row_coeff %for1
                        Coefficient_matrix(i,j) = Coefficient_matrix(i,j) - ...
                        L_ik*Coefficient_matrix(k,j); % ����a(i,j)              
                        disp( 'Coefficient_matrix(i,j) ');
                        disp( Coefficient_matrix(i,j) );
                        if ( j<col_coeff+1 &&stop==0)
                            aa(i,j)=Coefficient_matrix(i,j) ;
                            %fprintf('stop=%d\n',stop);
                        else
                            stop=1;
                            %fprintf('stop=%d\n',stop);
                         end %endif
                     disp(aa);%ÿһλ�ı仯
                     end %endfor1
               stop=0;
               Load_matrix(i) = Load_matrix(i) - Load_matrix(k)*L_ik; % ����b(i)
               %disp(Load_matrix(i));
                aa(i,j+1)=Load_matrix(i) ;
                disp(aa);
              %  fprintf('stop=%d\n',stop);
                Coefficient_matrix(i,1) = 0;   
                count = 0;
                for s=1:col_coeff
                    if aa(i,s)==0
                        count=count+1;
                    else
                       break ;
                    end
                end             
                    disp('count');
                    disp(count);
                if count==col_coeff
                    breakkey=0;
                    yy=Load_matrix(i) ;
                    yi=i;
                    break;
                else
                    continue;
                end
            end %for2ѭ������  
        
        disp('sss');
        aa(i,col_coeff-1)=0;
            end
        disp(aa);
        if breakkey==0
         break;
        end
end % forѭ������
disp('breakkey');
disp(breakkey);
if breakkey==0
    disp('yi');
    disp(yi );
    break;
end

end %while



