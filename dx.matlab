function  a=mo(b)
	for i=b(:)
		tempsum=i^2+tempsum;
	end
	a=tempsum^(0.5);
end


function [left,right]=fen(a,r,c,i)
	m=r;
	n=c;
	if i=='lu'
		if m～=n
			print "lu unable to solve (not square)";
			return 0;	
		end

		left=zeros(n,n);
		right=a;

		for i1=1:n   %主元
			left(i1,i1)=1;
			for j1=i1+1:m    %主元下每一行
				chenshu=a(j1,i1)/a(i1,i1);
				left(j1,i1)=chenshu;
				for k1=i1:n    %每一行
					right(j1,k1)=right(j1,k1)-chenshu*right(i1,k1);
				end
			end
		end

		print ‘A=LU\n’
		print ‘L=’
		print left
		print ‘\nU=’
		print right

		%lu
	%elseif i=='lup',lu with partical privots
	elseif i=='qr'
		left=zeros(m,n);
		right=zeros(n,n);
		for i=1:n         
			if i==1
				%x(i)=a(:,i);
				right(1,1)=mo(a(:,i));
				left(:,i)=a(:,i)./right(1,1);
			else
				%x(i)=a(:,i);
				left(:,i)=a(:,i);
				for j=1:i-1     
					right(j,i)=left(:,j)'*a(:,i);
					left(:,i)=left(:,i)-right(j,i)*u(j);

				end
				right(i,i)=mo(left(:,i));
				left(:,i)=left(:,i)/right(i,i);
			end
		end

		print 'A=QR'
		print 'Q='
		print left
		print 'R='
		print right

		%qr
	elseif i=='house'

		p=zeros(m,m);
		%left=p'
		right=a;
		for i=1:n
			if i==1
				tempu=a(:,1)-mo(a(:,1))*a(:,1);
				r1=eye(m)-tempu*tempu'.*2./tempu'*tempu;
				right=r1*right(:,:);
				p=r1;
			else
				tempu=a(i:,i)-mo(a(i:,i)).*a(i:,i)
				rtemp=eye(m-i+1)-tempu*tempu'.*2./tempu'*tempu;
				%right(i:,i:)=rtemp*right(i:,i:);
				r2=eye(m);
				r2(i:,i:)=rtemp;
				right=r2*right(:,:);
				p=r2*p;
			end
		end

		left=p';

		print 'household  A=QR'
		print 'Q='
		print left
		print 'R='
		print right






		%household
	elseif i=='given'

		p=eye(m,m);
		right=a;

		for num_col=1:n
			for num_row=num_col+1:m
				temp001=(right(num_col,num_col)^2+right(num_row,num_col)^2);
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

		print 'givens  A=QR'
		print 'Q='
		print left
		print 'R='
		print right









		%given
	else
		print 'error'

			
			