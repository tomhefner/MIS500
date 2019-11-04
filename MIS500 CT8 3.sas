/*enabled graphics image*/
ods noproctitle;
ods graphics / imagemap=on;

data Work._Paired_diffs_;
	set WORK.'MIS500 CT8'n;
	_Difference_=High_income_Percentage - Low_Income_Percentage;
	label 
		_Difference_="Difference: High_income_Percentage - Low_Income_Percentage";
run;

/* Test for normality to validate dataset*/
proc univariate data=Work._Paired_diffs_ normal mu0=0;
	ods select TestsForNormality;
	var _Difference_;
run;

/*paired t test to look at high and low income variables*/
proc ttest data=WORK.'MIS500 CT8'n sides=2 h0=0 plots(only showh0)=(summaryPlot 
		intervalPlot qqplot agreement);
	paired High_income_Percentage*Low_Income_Percentage;
run;

/* Clean up */
proc delete data=work._paired_diffs_;
run;