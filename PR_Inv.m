function [X] = PR_Inv(A)

	[n n] = size(A);

	% Se aplica algoritmul optimizat de descompunere QR pentru matricea data;
	Q = zeros(n);
	R = zeros(n);
	for i = 1:n
		R(i,i) = norm(A(:,i));
		Q(:,i) = A(:,i) / R(i,i);
		for j = i+1:n
			R(i,j) = Q(:,i)' * A(:,j);
			A(:,j) = A(:,j) - Q(:,i) * R(i,j);
		endfor
	endfor

	I = eye(n);
	X = zeros(n);

	% Se rezolva SST 
	for i = 1:n
		x_i = zeros(n,1);
		e_i = I(:,i);
		b = Q' * e_i;

		for j = n:-1:1
			S = 0;
			for k = j+1:n
				S = S + R(j,k) * x_i(k);
			endfor
			x_i(j) = (b(j) - S) / R(j,j);
		endfor

		X(:,i) = x_i;
	endfor

endfunction
