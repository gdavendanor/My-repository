 /* Geogebra to Asymptote conversion, documentation at artofproblemsolving.com/Wiki, go to User:Azjps/geogebra */
import graph; size(11.385cm); 
real labelscalefactor = 0.5; /* changes label-to-point distance */
pen dps = linewidth(0.7) + fontsize(10); defaultpen(dps); /* default pen style */ 
pen dotstyle = black; /* point style */ 
real xmin = -4.74, xmax = 6.645, ymin = -8.335, ymax = 17.9;  /* image dimensions */
pen qqwuqq = rgb(0.,0.39215686274509803,0.); 
Label laxis; laxis.p = fontsize(10); 
xaxis(xmin, xmax, Ticks(laxis, Step = 2., Size = 2, NoZero),EndArrow(6), above = true); 
yaxis(ymin, ymax, Ticks(laxis, Step = 2., Size = 2, NoZero),EndArrow(6), above = true); /* draws axes; NoZero hides '0' label */ 
 /* draw figures */
real f1 (real x) {return (x^(3.0)-1.0)/(x+1.0);} 
draw(graph(f1,-4.73,6.635), linewidth(1.2) + qqwuqq); 
draw((-1.,ymin)--(-1.,ymax), linetype("2 2")); /* line */
 /* dots and labels */
label("$f$", (-3.12,17.225), NE * labelscalefactor,qqwuqq); 
label("$g$", (-0.645,17.225), NE * labelscalefactor); 
clip((xmin,ymin)--(xmin,ymax)--(xmax,ymax)--(xmax,ymin)--cycle); 
 /* end of picture */