function R = Iterative(nume, d, eps)

	[N A L] = citire_date(nume);

	% Aproximarile initiale sunt egale cu 1/N;
	PR = zeros(1,N);
	for i =1:N
		PR(i) = 1/N;
	endfor

	while 1
		PR_vechi = PR;
			for i = 1:N
				S = 0;
				for j = 1:N
					% Daca j are link catre i :
					if (A(j,i))
						S = S + PR_vechi(j)/L(j);
					endif
				endfor
				PR(i) = (1-d)/N +d*S;
			endfor
			if norm(PR - PR_vechi) < eps
				break
			endif
	endwhile

	% Se returneaza ultimele valori care respecta conditia data;
	R = PR_vechi';

endfunction
