function y = Apartenenta(x, val1, val2)

	% x ∈ [0, val1);
	if x < val1
		y = 0;
	endif

	% x ∈ [val1, val2], se aplica formula pentru ca u(x) sa fie continua;
	if x >= val1 && x <= val2
		y = 1 / (val2 - val1) * x - val1 / (val2 - val1);
	endif

	% x ∈ (val2, 1];
	if x > val2
		y = 1;
	endif

endfunction
