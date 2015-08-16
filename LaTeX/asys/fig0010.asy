import graph; size(6.788225099390855cm); real lsf=0.5; pen dps=linewidth(0.7)+fontsize(10); defaultpen(dps); pen ds=black; real xmin=-3.3941125496954276,xmax=3.3941125496954276,ymin=-3.3941125496954276,ymax=3.3941125496954276; 
pen uuuuuu=rgb(0.26666666666666666,0.26666666666666666,0.26666666666666666); 
filldraw((0.,0.)--(2.,0.)--(2.,3.)--(0.,3.)--cycle,invisible,uuuuuu); filldraw((0.,0.)--(2.,0.)--(1.,2.5)--cycle,invisible,uuuuuu); filldraw((0.,0.)--(3.,0.)--(1.5,2.23606797749979)--cycle,invisible,uuuuuu); filldraw((0.,0.)--(2.,0.)--(1.,2.5)--cycle,invisible,uuuuuu); filldraw((0.,0.)--(3.,0.)--(1.5,2.23606797749979)--cycle,invisible,uuuuuu); 


clip((xmin,ymin)--(xmin,ymax)--(xmax,ymax)--(xmax,ymin)--cycle); 