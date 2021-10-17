function [N A L val1 val2] = citire_date(nume)

	% Se citesc datele problemei;
    fid = fopen(nume,'r');
	N = fscanf(fid,"%d",1);
	A = zeros(N,N);
	L = zeros(1,N);
	for i = 1:N
		nr_l = fscanf(fid,"%d",2);
		for j = 1:nr_l(2,1)
			curr = fscanf(fid,"%d",1);
			% Se verifica daca pagina curenta nu este un link catre ea insasi;
			if i ~= curr
				% Daca nu este, se adauga la matricea de adiacenta;
				L(i) ++;
				A(i,curr) = 1;
			endif
		endfor
	endfor
    val1 = fscanf(fid,"%f",1);
    val2 = fscanf(fid,"%f",1);
	fclose(fid);
    
endfunction
