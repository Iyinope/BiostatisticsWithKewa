proc import out = one datafile= 'C:\Users\Iyinope\Downloads\Q1.xlsx' dbms=xlsx 
replace;
run; 

proc print data = one; 
run; 


proc freq data = one;
tables x2*y;
run; 

proc freq data = one;
tables x3*y;
run;

proc freq data = one;
tables x4*y;
run;

proc means data= one mean std;
class y;
var x1;
run; 

proc freq data = one; 
tables y*x2 /chisq;
run; 

proc freq data = one; 
tables y*x3 /chisq;
run; 

proc freq data = one; 
tables y*x4 /chisq;
run; 

proc means data = one mean std;
class y;
var x1;
run; 



proc ttest data = one;
class y;
var x1;
run; 

data critical;
alpha = 0.05; /*Significance level */
df = 344; /*Degrees of freedom */
t_critical_value = quantile('T', 1 - alpha/2, df);
put t_critical_value=;
run;

proc print data = critical;
run; 

proc freq data = one; 
tables x3*x2*y /cmh;
run; 

proc logistic data = one desc;
class x2 (ref='0') x3 (ref='0') x4 (ref='0') /param= ref;
model y = x2 x3 x4 x1 / lackfit;
run; 
