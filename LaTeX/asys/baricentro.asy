settings.outformat = "pdf";
size(3cm);
pair A,B,C,X,Y,Z; 
A = (0,0);
B = (1,0);
C = (0.3,0.8);
draw(A--B--C--A);
X = (B+C)/2;
Y = (A+C)/2;
Z = (A+B)/2;
draw(A--X,red);
draw(B--Y,red);
draw(C--Z,red);