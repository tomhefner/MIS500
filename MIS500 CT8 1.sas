
/*enabled graphics image*/
ods noproctitle;
ods graphics / imagemap=on;


/*establishing procedure to perform correlation on imported data
  within work folder: 'MIS500 CT8'.  create matrix scatterplot set
  variable as Year with analytics performed on high income and low income percentage */
proc corr data=WORK.'MIS500 CT8'n pearson cov sscp csscp fisher(rho0=0 
		alpha=0.05 type=TwoSided) rank plots=matrix(nvar=2 nwith=2);
	var Year;
	with High_income_Percentage Low_Income_Percentage;
run;



/*enabled graphics image*/
ods noproctitle;
ods graphics / imagemap=on;

/*removing the year variable and replacing with low_income_percentage */
proc corr data=WORK.'MIS500 CT8'n pearson cov sscp csscp fisher(rho0=0 
		alpha=0.05 type=TwoSided) rank plots=matrix(nvar=2 nwith=2);
	var Low_Income_Percentage;
	with High_income_Percentage;
run;
