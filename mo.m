function  a=mo(b)
    tempsum=0;
	for i=b
		tempsum=(i^2)+tempsum;
        
	end
	a=tempsum^(0.5);
end