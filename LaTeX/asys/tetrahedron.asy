//Author Jens Schwaiger.
import polyhedron_js;

// comment the following line for OpenGl
settings.render=0;

settings.tex="pdflatex";
settings.outformat="pdf"; // for opacity

size(10cm);

// currentprojection=perspective(7,6,4); //if you want perspectivic look
currentprojection=orthographic(1,0.5,0.5); //if you want othographic look
currentlight=(1,1,2);
// currentlight=nolight;

polyhedron[] parr={tetrahedron};
filldraw(parr,new pen[]{0.8green},op=0.9);

if(!is3D()) {
  label("Tetrahedron",point(S),align=3S);
  shipout(bbox(3mm,darkblue+3bp+miterjoin,FillDraw(paleblue)));
}