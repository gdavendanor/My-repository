settings.outformat="pdf";
unitsize(1cm);
draw((-3.25,0) -- (4.25,0), arrow=Arrow(TeXHead));
draw((0,-1.25) -- (0,4.25), arrow = Arrow(TeXHead));
draw((-3,3) ..(-2,1)..(0,-1)..(1,0)..(2,3)..(3,4)..(3.5,3.65)..(4,3));
real r = 0.05pt;
fill(circle((-3,3),r));
fill(circle((4,3),r));