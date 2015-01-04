# set terminal pngcairo  transparent font "arial,10" fontscale 1.0 size 600, 400 
# set output 'simple.1.png'
set key inside left top vertical Right noreverse enhanced autotitle box linecolor -1 linewidth 1.000
set samples 50, 50
set title "Simple Plots" 
set title  font ",20" norotate
plot [-10:10] sin(x),atan(x),cos(atan(x))
