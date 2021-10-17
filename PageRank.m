function [R1 R2] = PageRank(nume, d, eps)

	[N A L val1 val2] = citire_date(nume);

	fout = fopen(strcat(nume,".out"),'w');
	fprintf(fout,"%d\n\n",N);

	R1 = Iterative(nume, d, eps);
	fprintf(fout,"%f\n",R1);
	fprintf(fout,"\n");

	R2 = Algebraic(nume, d);
	fprintf(fout,"%f\n",R2);
	fprintf(fout,"\n");

	[PR1 ind] = sort(R2,"descend");

	for i = 1:N
		fprintf(fout,"%d %d %f\n",i,ind(i), Apartenenta(PR1(i),val1,val2));
	endfor

	fclose(fout);

endfunction
