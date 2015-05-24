import math;
settings.outformat="pdf";
unitsize(1cm);
draw((-4.5,0) -- (4.5,0),arrow=Arrow(TeXHead));
draw((0,-2.5) -- (0,4.25), arrow = Arrow(TeXHead));
path p = (-4,-2) ..(-3,-1)..(-2.5,0)..(-2,1)..(-1,2.5)..(0,3)..(2,2)..(4,-1);
draw (p);
path q = (-4,2.5)..(-3,2)..(-2,1)..(0,0.5)..(1,1)..(2,2)..(3,4);
draw (q);
Label L1 = Label("$f$", position=MidPoint);
label(L1, p);
Label L2 = Label("$g$",position=MidPoint);
label(L2,q);
real r = 0.075pt;
fill(circle((-4,-2),r));
fill(circle((-4,2.5),r));
fill(circle((3,4),r));
fill(circle((4,-1),r));
draw((-4,-.1)--(-4,.1));
draw((4,-.1)--(4,.1));
draw((-3,-.1)--(-3,.1));
draw((-2,-.1)--(-2,.1));
draw((-1,-.1)--(-1,.1));
draw((1,-.1)--(1,.1));
draw((2,-.1)--(2,.1));
draw((3,-.1)--(3,.1));
draw((-.1,1)--(.1,1));
draw((-.1,2)--(.1,2));
draw((-.1,3)--(.1,3));
draw((-.1,4)--(.1,4));
draw((-.1,-1)--(.1,-1));
draw((-.1,-2)--(.1,-2));
label("1",(0,1),align=W);
label("1", (1,0), align=S);