/*enabled graphics image*/
ods noproctitle;
ods graphics / imagemap=on;

/*removing the year variable and replacing it with low_income_percentage */
/*this will allow base statistics to be executed*/
proc corr data=WORK.'MIS500 CT8'n pearson cov sscp csscp fisher(rho0=0 
		alpha=0.05 type=TwoSided) rank plots=matrix(nvar=2 nwith=2);
	var Low_Income_Percentage;
	with High_income_Percentage;
run;