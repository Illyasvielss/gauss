% Code from "Gauss elimination and Gauss Jordan methods using MATLAB"
% https://www.youtube.com/watch?v=kMApKEKisKE
%a=[1,2,3,1;  1,2,3,2; 2,3,3,2];
a=[1,2,3,1; 1,2,5,2;2,3,3,2;1,2,3,1;4,7,15,8];
%a = [3 4 -2 2 2 3
    %4 9 -3 5 8 4
    %-2 -3 7 6 10 5
    %1 4 6 7 2 6];%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gauss elimination method [m,n)=size(a);
[m,n]=size(a);
disp(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            t=a(j,:);a(j,:)=a(z,:);
            a(z,:)=t;
            disp('after change:');disp(a);
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
disp(a);
%x=zeros(1,m);
% for s=m:-1:1
%     c=0;
%     for k=2:m
%         c=c+a(s,k)*x(k);
%     end
%     x(s)=(a(s,n)-c)/a(s,s);
% end
