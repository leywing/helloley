function [left,right]=ley_fenjie(a,r,c,i)
	m=r;
	n=c;
	if i=='lu'
		if m~=n
			disp('lu unable to solve (not square)');
            left=zeros(m,m);
            right=zeros(m,m);
        else
            left=zeros(n,n);
            right=a;

            for i1=1:n   
                left(i1,i1)=1;
                for j1=i1+1:n    
                    chenshu=right(j1,i1)/right(i1,i1);
                    left(j1,i1)=chenshu;
                    for k1=i1:n
                        right(j1,k1)=right(j1,k1)-chenshu*right(i1,k1);
                    end
                end
            end

            disp('LU ');
            disp('L=');
            disp(left);
            disp('U=');
            disp(right);
        end
		%lu
	%elseif i=='lup',lu with partical privots
	elseif i=='qr'
		left=zeros(m,n);
		right=zeros(n,n);
		for i=1:n         
			if i==1
				%x(i)=a(:,i);
				right(1,1)=mo(a(:,i)');
				left(:,i)=a(:,i)./right(1,1);
			else
				%x(i)=a(:,i);
				left(:,i)=a(:,i);
				for j=1:i-1     
					right(j,i)=left(:,j)'*a(:,i);
					left(:,i)=left(:,i)-right(j,i)*left(:,j);

				end
				right(i,i)=mo(left(:,i)');
				left(:,i)=left(:,i)/right(i,i);
			end
		end

		disp('A=QR');
		disp('Q=')
		disp(left)
		disp('R=')
		disp(right)

		%qr
	elseif i=='ho'
        if m>n
            real=n;
        elseif m<n
            real=m;
        else
            real=m;
        end
        
		p=zeros(m,m);
		%left=p'
		right=a;
        iiiitemp=eye(m);
		for i=1:real
			if i==1
				tempu=a(:,1)-mo(right(:,1)')*iiiitemp(:,1);
				r1=eye(m)-(tempu*tempu').*2./(tempu'*tempu);
				right=r1*right(:,:);
				p=r1;
            else
                if i~=m
				tempu=right(i:m,i)-mo(right(i:m,i)').*iiiitemp(i:m,i);
				rtemp=eye(m-i+1)-(tempu*tempu').*2./(tempu'*tempu);
				%right(i:,i:)=rtemp*right(i:,i:);
				r2=eye(m);
				r2(i:m,i:m)=rtemp;
				right(:,:)=r2*right(:,:);
				p=r2*p;
                end
			end
		end

		left=p';

		disp('household  A=QR')
		disp('Q=')
		disp(left)
		disp('R=')
		disp(right)

		%household
	elseif i=='gi'
        if m>n
            real=n;
        elseif m<n
            real=m;
        else
            real=m;
        end
		p=eye(m,m);
		right=a;

		for num_col=1:real
			for num_row=num_col+1:m
                
				temp001=(right(num_col,num_col)^2+right(num_row,num_col)^2)^(0.5);
				cos_001=right(num_col,num_col)/temp001;
				sin_001=right(num_row,num_col)/temp001;
				p_temp=eye(m);
				p_temp(num_col,num_col)=cos_001;
				p_temp(num_row,num_row)=cos_001;
				p_temp(num_col,num_row)=sin_001;
				p_temp(num_row,num_col)=-sin_001;

				right(:,:)=p_temp*right(:,:);
				p=p_temp*p;
                
            

			end
		end

		left=p';

		disp('givens  A=QR')
		disp('Q=')
		disp(left)
		disp('R=')
		disp(right)

		%given
	else
		disp('error,no one suit')
    
    end
   

			
			