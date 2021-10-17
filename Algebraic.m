function R = Algebraic(nume, d)

	[N A L] = citire_date(nume);

	K_inv = zeros(N);

	% Se calculeaza direct K^(-1) ca avand 1/L(i) pe diagonala si 0 in rest; 
	for i = 1:N
		K_inv(i,i) = 1/L(i);
	endfor
	
	M = (K_inv*A)';

	R = PR_Inv(eye(N)-d*M) * ((1-d)/N) * ones(N,1);

endfunction
