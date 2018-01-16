data crime;
 input state $1-15 murder rape robbery assault burglary larceny auto state $ region $;
 cards;
 Alabama         14.2 25.2 96.8 278.3 1135.5 1881.9 280.7 AL S 
 Alaska          10.8 51.6 96.8 284.0 1331.7 3369.8 753.3 AK W
 Arizona         9.5 34.2 138.2 312.3 2346.1 4467.4 439.5 AZ W
 Arkansas        8.8 27.6 83.2 203.4 972.6 1862.1 183.4 AR S 
 California      11.5 49.4 287.0 358.0 2139.4 3499.8 663.5 CA W 
 Colorado        6.3 42.0 170.7 292.9 1935.2 3903.2 477.1 CO W 
 Connecticut     4.2 16.8 129.5 131.8 1346.0 2620.7 593.2 CT E 
 Delaware        6.0 24.9 157.0 194.2 1682.6 3678.4 467.0 DE E 
 Florida         10.2 39.6 187.9 449.1 1859.9 3840.5 351.4 FL S 
 Georgia         11.7 31.1 140.5 256.5 1351.1 2170.2 297.9 GA S 
 Hawaii          7.2 25.5 128.0 64.1 1911.5 3920.4 489.4 HI W 
 Idaho           5.5 19.4 39.6 172.5 1050.8 2599.6 237.6 ID W 
 Illinois        9.9 21.8 211.3 209.0 1085.0 2828.5 528.6 IL M 
 Indiana         7.4 26.5 123.2 153.5 1086.2 2498.7 377.4 IN M 
 Iowa            2.3 10.6 41.2 89.8 812.5 2685.1 219.9 IA M 
 Kansas          6.6 22.0 100.7 180.5 1270.4 2739.3 244.3 KS M 
 Kentucky        10.1 19.1 81.1 123.3 872.2 1662.1 245.4 KY S 
 Louisiana       15.5 30.9 142.9 335.5 1165.5 2469.9 337.7 LA S 
 Maine           2.4 13.5 38.7 170.0 1253.1 2350.7 246.9 ME E 
 Maryland        8.0 34.8 292.1 358.9 1400.0 3177.7 428.5 MD E 
 Massachusetts   3.1 20.8 169.1 231.6 1532.2 2311.3 1140.1 MA E 
 Michigan        9.3 38.9 261.9 274.6 1522.7 3159.0 545.5 MI M 
 Minnesota       2.7 19.5 85.9 85.8 1134.7 2559.3 343.1 MN M 
 Mississippi     14.3 19.6 65.7 189.1 915.6 1239.9 144.4 MS S 
 Missouri        9.6 28.3 189.0 233.5 1318.3 2424.2 378.4 MO M 
 Montana         5.4 16.7 39.2 156.8 804.9 2773.2 309.2 MT W 
 Nebraska        3.9 18.1 64.7 112.7 760.0 2316.1 249.1 NE M 
 Nevada          15.8 49.1 323.1 355.0 2453.1 4212.6 559.2 NV W 
 New Hampshire   3.2 10.7 23.2 76.0 1041.7 2343.9 293.4 NH E 
 New Jersey      5.6 21.0 180.4 185.1 1435.8 2774.5 511.5 NJ E 
 New Mexico      8.8 39.1 109.6 343.4 1418.7 3008.6 259.5 NM W 
 New York        10.7 29.4 472.6 319.1 1728.0 2782.0 745.8 NY E 
 North Carolina  10.6 17.0 61.3 318.3 1154.1 2037.8 192.1 NC S 
 North Dakota    0.9 9.0 13.3 43.8 446.1 1843.0 144.7 ND M 
 Ohio            7.8 27.3 190.5 181.1 1216.0 2696.8 400.4 OH M 
 Oklahoma        8.6 29.2 73.8 205.0 1288.2 2228.1 326.8 OK S 
 Oregon          4.9 39.9 124.1 286.9 1636.4 3506.1 388.9 OR W 
 Pennsylvania    5.6 19.0 130.3 128.0 877.5 1624.1 333.2 PA E 
 Rhode Island    3.6 10.5 86.5 201.0 1489.5 2844.1 791.4 RI E 
 South Carolina  11.9 33.0 105.9 485.3 1613.6 2342.4 245.1 SC S 
 South Dakota    2.0 13.5 17.9 155.7 570.5 1704.4 147.5 SD M 
 Tennessee       10.1 29.7 145.8 203.9 1259.7 1776.5 314.0 TN S 
 Texas           13.3 33.8 152.4 208.2 1603.1 2988.7 397.6 TX S 
 Utah            3.5 20.3 68.8 147.3 1171.6 3004.6 334.5 UT W 
 Vermont         1.4 15.9 30.8 101.2 1348.2 2201.0 265.2 VT E 
 Virginia        9.0 23.3 92.1 165.7 986.2 2521.2 226.7 VA S 
 Washington      4.3 39.6 106.2 224.8 1605.6 3386.9 360.3 WA W 
 West Virginia   6.0 13.2 42.2 90.9 597.4 1341.7 163.3 WV E 
 Wisconsin       2.8 12.9 52.2 63.7 846.9 2614.2 220.7 WI M 
 Wyoming         5.4 21.9 39.7 173.9 811.6 2772.2 282.0 WY W
 ;
 
        
 
*principle analysis;
proc princomp data=crime cov out=aa outstat=aa_stat;
var  murder rape robbery assault burglary larceny auto;
run;
proc score data=crime score=aa_stat out=FScore;
var   murder rape robbery assault burglary larceny auto;
run;


GOPTIONS RESET=ALL;
proc corr data=aa;         *the principal components are uncorrelated/independent;
 var prin1-prin7;
run;
SYMBOL1 pointlabel=('#state')V=circle C=black I=none;
TITLE1 "Crime Rates per 100,000 Population by State";
TITLE2 "Plot of the First Two Principal Components";;
proc gplot;
 title 'PLOT OF the First Two PRINCIPAL COMPONENTS';
 plot prin2*prin1;
* symbol1 v=1 c=red;
run;

**pcs for crime data by region;
SYMBOL1 pointlabel=('#region')V=star C=black I=none;
SYMBOL2 pointlabel=('#region')V=circle C=red I=none;
SYMBOL3 pointlabel=('#region')V=square C=blueviolet I=none;
SYMBOL4 pointlabel=('#region')V=triangle C=green I=none;
title "95% Control Ellipse";
title2 "First and second principal components";
proc sgplot data=aa  noautolegend;
   scater x=prin1 y=prin2/datalabel=region;
   ellipse x=prin1 y=prin2/alpha=0.05;           /* default is ALPHA=0.05 */
run;

proc gplot;
title 'Principals for crime data by region';
 plot prin2*prin1=REGION/href=0 vref=0;
run;
quit;

title "95% Prediction Ellipse";
title2 "First and second principal components";
proc sgplot data=aa  noautolegend;
   scater x=prin1 y=prin2/datalabel=state;
   ellipse x=prin1 y=prin2/alpha=0.05;           /* default is ALPHA=0.05 */
run;
*factor analysis;
proc factor data=crime  ;
var murder rape robbery assault burglary larceny auto ;
run;

proc factor data=crime rotate=v reorder n=2 out=ff outstat=ff_1 plot;
 var murder rape robbery assault burglary larceny auto  ;
run;

proc factor data=crime rotate=v reorder method=ml heywood n=2  ;
var murder rape robbery assault burglary larceny auto ;
run;

proc score data=crime score=ff_1 out=FScore;
var  murder rape robbery assault burglary larceny auto; 
run;
proc print data=FScore;
run;
proc corr data=ff;
run;


proc gplot;
title 'PLOT OF FACTORS FOR CRIME DATA';
 plot factor2*factor1=state;
run;
 **********LANBLE REGION******;
SYMBOL1 pointlabel=('#region')V=star C=black I=none;
SYMBOL2 pointlabel=('#region')V=circle C=red I=none;
SYMBOL3 pointlabel=('#region')V=square C=blueviolet I=none;
SYMBOL4 pointlabel=('#region')V=triangle C=green I=none;
proc gplot;
title 'Factors for crime data by region';
 plot factor2*factor1=REGION/href=0 vref=0;
run;
 
******discriminant analysis*****;
proc stepdisc data=crime ;
 *this will test the equality of the variance covariance matrices;
 class region;
 var  murder rape robbery assault burglary larceny auto ;
run;


proc discrim data=crime method=normal  pool=test slpool=0.05;*wcov short;
 *this will test the equality of the variance covariance matrices;
 class region;
 var  murder rape robbery assault burglary larceny auto ;
run;

proc discrim data=crime pool=yes out=out outd=outd;
 *we will pool in this example if though it is INappropriate;
 class region;
 var  murder rape robbery assault burglary larceny auto ;
* priors  'E'=0.25 'M'=0.25  'S'=0.25 'W'=0.25;
run;

proc discrim data=ff pool=test wcov short ;
 class region;
 var factor2 factor1;
run;


proc discrim data=aa pool=test wcov short ;
 class region;
 var prin1 prin2;
run;

proc discrim data=aa pool=test wcov short ;
 class region;
 var prin1 prin2;
run;
***MANOVA**;
proc glm data=crime;
class region;
model murder rape robbery assault burglary larceny auto= region/ss3;
manova h=_all_/printe;
means region;
run;

